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

local a=loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Library/main/ArgetnarLibrary.lua"))()local b=a:Window("Argetnar Hub")a:Notify("KeyHub","Your in!")local c=b:Tab("Key")loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/Key.lua"))()function MakeScriptHub()loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Ui/main/loader.lua"))()end;function CorrectKeyNotifications()a:Notify("KeyHub","Key Correct!")end;function WrongKeyNotifications()a:Notify("KeyHub","Key Wrong!")end;function GetKeyNotifications()a:Notify("KeyHub","Discord Link Copied =)")end;c:TextBox("Enter Key",function(d)_G.KeyInput=d end)c:Button("Check Key!",function()if _G.KeyInput==_G.EnterKey then CorrectKeyNotifications()wait(3)MakeScriptHub()else WrongKeyNotifications()end end)c:Button("GetKey",function()setclipboard("https://discord.gg/w7H6G66xCK")GetKeyNotifications()end)local e=b:Tab("Support Games")e:Label("Anime Evolution Sim")e:Label("Dinosaur Sim")e:Label("Elemental Fighting Sim")e:Label("High School Life")e:Label("Sheep Tycoon")e:Label("Tapper Sim")e:Label("Pet Sim X!")e:Label("Coming Soon!")e:Label("Coming Soon!")local f=b:Tab("Misc")f:Button("Destroy",function()game.CoreGui.MangoHub:Destroy()end)local g=b:Tab("Credits")g:Label("Hub by Argetnar & Doku & Brinen")local h=g:Label("v2.8")a:Notify("Script","Was Loaded!")
