-- Модуль для создания кнопки в центре экрана

local Module = {}

function Module.CreateButton(player)
    -- Создание ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player.PlayerGui

    -- Создание кнопки
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5, -25) -- Центр экрана
    button.Text = "Нажми меня"
    button.Parent = screenGui

    -- Возвращаем кнопку для дальнейших операций с ней
    return button
end

return Module
