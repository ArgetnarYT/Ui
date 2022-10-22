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

function Invite()if not isfolder("Argetnar")then makefolder("Argetnar")end;if isfile("Argetnar.txt")==false then(syn and syn.request or http_request)({Url="http://127.0.0.1:6463/rpc?v=1",Method="POST",Headers={["Content-Type"]="application/json",["Origin"]="https://discord.com"},Body=game:GetService("HttpService"):JSONEncode({cmd="INVITE_BROWSER",args={code="w7H6G66xCK"},nonce=game:GetService("HttpService"):GenerateGUID(false)}),writefile("Argetnar.txt","discord")})end end;do Invite()local a="https://discord.gg/w7H6G66xCK"local b;local c=pcall(function()b=game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Ui/main/Games/"..game.PlaceId..".lua")end)if c then loadstring(b)()else game:GetService"Players".LocalPlayer:Kick("Argetnar Hub don't support this game, discord link was copied to your clipboard.")Invite()setclipboard(a)end end
