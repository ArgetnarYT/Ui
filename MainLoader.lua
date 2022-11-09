--[[

  ____                                  _                      _    _       _     
 |  _ \            /\                  | |                    | |  | |     | |    
 | |_) |_   _     /  \   _ __ __ _  ___| |_ _ __   __ _ _ __  | |__| |_   _| |__  
 |  _ <| | | |   / /\ \ | '__/ _` |/ _ \ __| '_ \ / _` | '__| |  __  | | | | '_ \ 
 | |_) | |_| |  / ____ \| | | (_| |  __/ |_| | | | (_| | |    | |  | | |_| | |_) |
 |____/ \__, | /_/    \_\_|  \__, |\___|\__|_| |_|\__,_|_|    |_|  |_|\__,_|_.__/ 
         __/ |                __/ |                                               
        |___/                |___/                                                

]]
local ArgetnarLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Library/main/ArgetnarLibrary.lua"))()
local win = ArgetnarLib:Window("Argetnar Hub")
local TabFarm = win:Tab("Info")
TabFarm:Label("Hub has been patched")
TabFarm:Button("Copy the link to the Open Source", function()
    setclipboard('https://github.com/ArgetnarYT/Ui-OS')
end)

TabFarm:Button("This script by Argetnar Hub", function()
    setclipboard('https://discord.gg/9WGczwFcZx')
end)
