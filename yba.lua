local TeleportService = game:GetService("TeleportService")
local player = game.Players.LocalPlayer

local function ServerHop()
    local placeId = game.PlaceId
    local servers = game:GetService("HttpService"):JSONDecode(
        game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100")
    )

    for _, server in ipairs(servers.data) do
        if server.playing < server.maxPlayers and server.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(placeId, server.id, player)
            break
        end
    end
end

local function CheckItems()
    local itemsFound = false
    for _, v in pairs(game.Workspace.Item_Spawns.Items:GetChildren()) do
        local item = v:FindFirstChild("MeshPart")
        if item and item:FindFirstChild("PointLight") then
            itemsFound = true
            break
        end
    end
    return itemsFound
end

function mainTP()
    while tpOn do
        maxItems()
        local itemsExist = CheckItems()

        if not itemsExist then
            print("No items found, hopping to another server...")
            ServerHop()
            break
        end

        for _, v in pairs(game.Workspace.Item_Spawns.Items:GetChildren()) do
            local item = v:FindFirstChild("MeshPart")
            if item and item:FindFirstChild("PointLight") then
                local proxPrompt = v.ProximityPrompt
                while item:IsDescendantOf(game.Workspace) and tpOn do
                    local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
                    travelTo(item)
                    if (item.Position - plr.Position).Magnitude < 5 then
                        maxItems()
                        fireproximityprompt(proxPrompt, 4)
                    end
                    task.wait(0.05)
                end
                maxItems()
            else
                travelTo(zone)
            end
        end
        task.wait(1)
    end
end
