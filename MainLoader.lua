local ArgetnarLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Library/main/ArgetnarLibrary.lua"))()
local win = ArgetnarLib:Window("Argetnar Hub")
ArgetnarLib:Notify("KeyHub", "Yuor in!")
local TabKey = win:Tab("Key")

loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/Key.lua"))()


function MakeScriptHub()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Ui/main/loader.lua"))()
end

function CorrectKeyNotifications()
ArgetnarLib:Notify("KeyHub", "Key Correct!")
end

function WrongKeyNotifications()
ArgetnarLib:Notify("KeyHub", "Key Wrong!")
end

function GetKeyNotifications()
ArgetnarLib:Notify("KeyHub", "Discord Link Copied =)")
end
TabKey:TextBox("Enter Key", function(Value)
       _G.KeyInput = Value
end)
TabKey:Button("Check Key!", function()
            if _G.KeyInput == _G.EnterKey then
			CorrectKeyNotifications()
			wait(3)
         MakeScriptHub()
     else
        WrongKeyNotifications()
        end
end)
TabKey:Button("GetKey", function()
          		setclipboard("https://discord.gg/w7H6G66xCK")
			  GetKeyNotifications()
end)
local TabGame = win:Tab("Support Games")
TabGame:Label("Anime Evolution Sim")
TabGame:Label("Dinosaur Sim")
TabGame:Label("Elemental Fighting Sim")
TabGame:Label("High School Life")
TabGame:Label("Sheep Tycoon")
TabGame:Label("Tapper Sim")
TabGame:Label("Coming Soon!")
TabGame:Label("Coming Soon!")
TabGame:Label("Coming Soon!")
local TabMisc = win:Tab("Misc")
TabMisc:Button("Destroy", function()
    game.CoreGui.MangoHub:Destroy();
end)
local TabCredit = win:Tab("Credits")
TabCredit:Label("Hub by Argetnar & Doku & Brinen")
local LabelRef = TabCredit:Label("v1")
wait(10)
LabelRef:Refresh("v2")
ArgetnarLib:Notify("Script", "Was Loaded!")
