-- script.lua

-- Загружаем и выполняем gui.lua
dofile("gui.lua")

-- Вызываем функцию, определенную в gui.lua
if _G.showMessage then
    _G.showMessage("Это вызов из script.lua через dofile!")
else
    print("Функция showMessage не найдена!")
end
