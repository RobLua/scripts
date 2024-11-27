warn("new")
print("yo2")
local player = game.Players.LocalPlayer
local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/RobLua/scripts/main/gui.lua")()
local button = module.CreateButton(player)
button.MouseButton1Click:Connect(function()
    print("Кнопка нажата!")
end)
