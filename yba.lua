-- script.lua

-- Подключаем gui.lua с помощью loadfile
local guiFile = loadfile("gui.lua") -- Указываем путь к gui.lua
if guiFile then
    guiFile() -- Выполняем gui.lua
end

-- Теперь используем переменные или функции, определенные в gui.lua
if _G.showMessage then
    _G.showMessage("Привет из script.lua!")
else
    print("Функция showMessage не найдена!")
end
