-- /scripts/yba/gui.lua
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.5, -25)
Button.Text = "Click Me!"
Button.Parent = ScreenGui

-- Сохраняем кнопку в глобальной таблице для доступа из другого скрипта
_G.ClickButton = Button
