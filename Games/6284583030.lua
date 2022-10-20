
    local SettingsTable = {
      FarmNearest = nil;
      FarmRandom = nil;
      MultiTarget = false;
      GemFarm = nil;
      AreaFarm = nil;
      FarmSelectedCoin = nil;
      -----------------------------------------
      FastColect = true;
      LootBag = nil;
      RankRew = nil;
      FreeGift = nil;
      RemEggAnimation = nil;
   }
  
  game:GetService("Players").LocalPlayer.Idled:connect(
  function()
      game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
      wait(1)
      game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
  end)
      
  -- \ Anti AFK
     function GetMyPets()
      local returntable = {}
      for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
          if v.ClassName == 'TextButton' and v.Equipped.Visible then
              table.insert(returntable, v.Name)
          end
      end
      return returntable
   end
  
  
     local CurrentFarmingPets = {}
     local pethingy = GetMyPets()
     local cointhiny = nil
     local cointhiny2 = nil
  
  
     local areaTable = {
      --Misc
      ['VIP'] = {'VIP'};
      --Spawn
      ['Town'] = {'Town', 'Town FRONT'}; ['Forest'] = {'Forest', 'Forest FRONT'}; ['Beach'] = {'Beach', 'Beach FRONT'}; ['Mine'] = {'Mine', 'Mine FRONT'}; ['Winter'] = {'Winter', 'Winter FRONT'}; ['Glacier'] = {'Glacier', 'Glacier Lake'}; ['Desert'] = {'Desert', 'Desert FRONT'}; ['Volcano'] = {'Volcano', 'Volcano FRONT'}; ['Tech'] = {'Tech', 'Tech FRONT'};
      -- Fantasy init
      ['Enchanted Forest'] = {'Enchanted Forest', 'Enchanted Forest FRONT'}; ['Ancient Island'] = {'Ancient Island'}; ['Samurai Island'] = {'Samurai Island', 'Samurai Island FRONT'}; ['Candy Island'] = {'Candy Island'}; ['Haunted Island'] = {'Haunted Island', 'Haunted Island FRONT'}; ['Hell Island'] = {'Hell Island'}; ['Heaven Island'] = {'Heaven Island'};
      -- Tech
      ['Ice Tech'] = {'Ice Tech'}; ['Tech City'] = {'Tech City'; 'Tech City FRONT'}; ['Dark Tech'] = {'Dark Tech'; 'Dark Tech FRONT'}; ['Steampunk'] = {'Steampunk'; 'Steampunk FRONT'}, ['Alien Forest'] = {"Alien Forest"; "Alien Forest FRONT"}, ['Alien Lab'] = {"Alien Forest"; "Alien Lab FRONT"}, ['Glitch'] = {"Glitch"; "Glitch FRONT"}; ['Hacker Portal'] = {"Hacker Portal", "Hacker Portal FRONT"};
      -- Axolotl
      ['Axolotl Ocean'] = {'Axolotl Ocean', 'Axolotl Ocean FRONT'}; ['Axolotl Deep Ocean'] = {'Axolotl Deep Ocean', 'Axolotl Deep Ocean FRONT'}; ['Axolotl Cave'] = {'Axolotl Cave', 'Axolotl Cave FRONT'};
  }
  
  local AreaList = {
  'Town'; 'Forest'; 'Beach'; 'Mine'; 'Winter'; 'Glacier'; 'Desert'; 'Volcano'; -- Spawn World
  'Enchanted Forest'; 'Ancient Island'; 'Samurai Island'; 'Candy Island'; 'Haunted Island'; 'Hell Island'; 'Heaven Island'; -- Fantasy World
  'Ice Tech'; 'Tech City'; 'Dark Tech'; 'Steampunk'; 'Alien Lab'; 'Alien Forest'; 'Glitch'; "Hacker Portal"; -- Tech World
  'Axolotl Ocean'; 'Axolotl Deep Ocean'; 'Axolotl Cave' -- Axolotl World
  }
  
  
     -------------------------------
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "buy egg")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "join coin")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "farm coin")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "claim orbs")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "change pet target")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "get trade")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "add trade pet")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "remove trade pet")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "convert to dark matter")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem dark matter pet")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem rank rewards")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem vip rewards")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "toggle setting")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("a", "activate boost")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "use golden machine")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "use rainbow machine")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "buy upgrade")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem merch code")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "redeem free gift")
     workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "fuse pets")
     -------------------------------
  
     function FarmCoin(CoinID, PetID)
      game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
      game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
   end
     
  
         function GetThePets()
          local returntable = {}
          for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
              if v.ClassName == 'TextButton' and v.Equipped.Visible then
                  table.insert(returntable, v.Name)
              end
          end
          return returntable
       end
  
       local Chests = {
           "All"; -- All Chests
          -- Spawn
          "Volcano Magma Chest",
          -- Fantasy
          "Ancient Island Enchanted Chest", "Hell Island Hell Chest", "Haunted Island Haunted Chest", "Heaven Island Angel Chest", "Heavens Gate Grand Heaven Chest",
          -- Tech
          "Giant Tech Chest", "Giant Steampunk Chest", "Giant Alien Chest",
          -- Other 
          "Giant Present",
          -- Axolotl
          "Giant Ocean Chest",
          -- Pixel World
          "Giant Pixel Chest"
       }
  ----locals
     local check = checklists
     local lib = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))
     local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))
     local GameLibrary = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))


--lib
getgenv().UwU = loadstring(game:HttpGet"https://raw.githubusercontent.com/L1ZOT/Project-PJM/main/Notifycation")()
local ArgetnarLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Library/main/ArgetnarLibrary.lua"))()
local win = ArgetnarLib:Window("Argetnar Hub")

ArgetnarLib:Notify("Script", "Loading.....")
local TabFarm = win:Tab("Farm")
TabFarm:Toggle("Auto Farm - Gems", function(value)
        getgenv().FarmGems = value
end)
TabFarm:Toggle("Auto Farm - Nearest", function(value)
getgenv().FarmNearest = value
end)

         spawn(function()
            while task.wait(.7) do
                if game:GetService("Workspace")["__THINGS"].Orbs:FindFirstChildOfClass("Part") and (FarmCoinHealth 
                or SettingsTable.MultiTarget or SettingsTable.FarmNearest or SettingsTable.AreaFarm 
                or UltraAreaFarm or FarmSelectedCoin or SettingsTable.GemFarm or ChestFarm or SettingsTable.GemFarm) then
                    local TweenService = game:GetService("TweenService")

                    for i,v in pairs(game:GetService("Workspace")["__THINGS"].Orbs:GetChildren()) do
                        if v:IsA("Part") and v:FindFirstChild("Orb") then
                            v.Orb.Sunray:Destroy()
                            TweenService:Create(
                                v,
                                TweenInfo.new(.3, Enum.EasingStyle.Linear),
                                {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame}
                            ):Play()
                        end
                    end
                end
            end
        end)
  





 spawn(function()
      while game:GetService("RunService").Heartbeat:wait() do
          if getgenv().FarmNearest then
              pcall(function()
  
                  function FarmCoins(CoinID, PetID)
                      game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                      game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})                
                  end
  
                  function FindPets()
                      local Returntable = {}
                          for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                              if v.ClassName == "TextButton" and v.Equipped.Visible then
                                  table.insert(Returntable, v.Name)
                              end
                          end
                      return Returntable
                  end
  
                  local Closestcoin = tonumber(425)
                  function BringCoins()
                      local Returntable = {}
                
                      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                      for i,v in pairs(ListCoins) do
                          if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude < Closestcoin then
                              local Coin = v
                              Coin["index"] = i
                              table.insert(Returntable, Coin)
                              Closestcoin = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude
                          end
                      end
                      return Returntable
                  end
  
                  local petthingy = FindPets()
  
                  local cointhiny = BringCoins()
  
                  for i = 1, #cointhiny do
                      coroutine.wrap(function()
                          FarmCoins(cointhiny[i].index, petthingy[i%#petthingy+1])
                      end)()
                  end
              end)
          end
      end
     end)

spawn(function()
    while task.wait() do
        if getgenv().FarmGems then 
            for i,v in pairs(FindPlayersPets) do
                pcall(function()
                    FarmCoins4(FindGems(), v)
                end)
                 end
        function FindGems()
            for i,v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetDescendants()) do
                if v:IsA"MeshPart" then
                    if v.MeshId == 'rbxassetid://7041620873' or v.MeshId == 'rbxassetid://7041621431' or v.MeshId == 'rbxassetid://7041621329' or v.MeshId == 'rbxassetid://7041620873' then
                        a = v.Parent.Name
                    end
                end
            end
            return a
        end
    end
end
end)











TabFarm:Toggle("Auto Pickup - Coins - Gems", function(value)
    getgenv().AutoCoin = value
        while getgenv().AutoCoin do task.wait() 
            for i,v in pairs(game:GetService("Workspace")["__THINGS"].Orbs:GetChildren()) do
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,0,0)
                for i,v in pairs(game:GetService("Workspace")["__THINGS"].Lootbags:GetChildren()) do
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,0,0)
                end
            end
        end
end)

TabFarm:Toggle("Auto equip best pets", function(t)
          getgenv().BestPet = t
          while wait() do
              if getgenv().BestPet == true then
          pcall(function()
  local args = {
      [1] = {}
  }
  workspace.__THINGS.__REMOTES:FindFirstChild("equip best pets"):InvokeServer(unpack(args))
          end)
      end
  end
end)

local TabBuy = win:Tab("Misc")
TabBuy:Toggle("Anti Mod", function(value)
        getgenv().antiMod = value   
end)

TabBuy:Toggle("Auto Collect Gifts", function(t)
      SettingsTable.FreeGift = t
          while SettingsTable.FreeGift do task.wait()
              pcall(function()
                  --function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
                local ohTable1 = {
                   [1] = math.random(1, 12)
                }
                workspace.__THINGS.__REMOTES["redeem free gift"]:InvokeServer(ohTable1)
              end)
          end
end)

TabBuy:Button("Get All Gamepasses", function()
        local pass = require(game:GetService("ReplicatedStorage").Framework.Client["5 | Gamepasses"])

    pass.Owns = function() return true end
end)

TabBuy:TextBox("Type in Wait Time", function(t)
setTime = t
end)
 maxhealth = 2500000000000000000

TabBuy:Slider("Select Health", 1, maxhealth, 500, function(t)
          SelHealth = t
end)

TabBuy:Slider("Select Distance", 1, 400, 307, function(t)
          SelDistacne = v
end)
  
  local CratesMasteryList = {"Town Crate"; "Forest Crate"; "Beach Crate"; "Mine Crate"; "Desert Crate"; "Volcano Crate"; "Winter Crate"; "Glacier Crate"; "Enchanted Forest Crate"; "Ancient Island Crate"; "Samurai Island Crate"; "Candy Island Crate"; "Haunted Island Crate"; "Hell Island Crate"; "Heaven Island Crate"; "Tech City Crate"; "Dark Tech Crate"; "Alien Forest Crate"; "Axolotl Ocean Crate"; "Pixel Forest Crate"; "Pixel Alps Crate";}
  
  local CoinsPilesMasteryList ={"Town Coins", "Town Large Coins", 'Town Tiny Coins', "Forest Coins", "Forest Large Coins", "Forest Tiny Coins", "Beach Coins", "Beach Large Coins", "Beach Tiny Coins", "Mine Coins", "Mine Large Coins", "Mine Tiny Coins", "Desert Coins", "Desert Large Coins", "Desert Tiny Coins", "Volcano Coins", "Volcano Large Coins", "Volcano Tiny Coins", "Winter Coins", "Winter Large Coins", "Winter Tiny Coins", "Glacier Coins", "Glacier Large Coins", "Glacier Tiny Coins", "Enchanted Forest Coins", "Enchanted Forest Large Coins", "Enchanted Forest Tiny Coins", "Ancient Island Coins", "Ancient Island Large Coins", "Ancient Island Tiny Coins", "Samurai Island Coins", "Samurai Island Large Coins", "Samurai Island Tiny Coins", "Candy Island Coins", "Candy Island Large Coins", "Candy Island Tiny Coins", "Haunted Island Coins", 'Haunted Island Large Coins', 'Haunted Island Tiny Coins', 'Heaven Island Coins', 'Heaven Island Large Coins', 'Heaven Island Tiny Coins', 'Tech City Coins', 'Tech City Large Coins', 'Tech City Tiny Coins', 'Dark Tech Coins', 'Dark Tech Large Coins', 'Dark Tech Tiny Coins', 'Steampunk Coins', 'Steampunk Large Coins', 'Steampunk Tiny Coins', 'Alien Lab Coins', 'Alien Lab Large Coins', 'Alien Lab Tiny Coins', 'Alien Forest Coins', 'Alien Forest Large Coins', 'Alien Forest Tiny Coins', 'Blue Glitched Coins', 'Blue Glitched Large Coins', 'Blue Glitched Tiny Coins', 'Pink Glitched Coins', 'Pink Glitched Large Coins', 'Pink Glitched Tiny Coins', 'Axolotl Ocean Coins', 'Axolotl Ocean Large Coins', 'Axolotl Ocean Tiny Coins', 'Pixel Forest Coins', 'Pixel Forest Large Coins', 'Pixel Forest Tiny Coins', 'Pixel Kyoto Coins', 'Pixel Kyoto Large Coins'}
  
  local ChestsMasteryList = {'Town Chest', "Forest Small Chest", "Forest Chest", "Beach Chest", "Beach Small Chest", "Mine Small Chest", "Mine Chest", "Desert Chest", "Desert Small Chest", "Winter Chest", "Winter Small Chest", "Glacier Chest", "Glacier Small Chest", "Enchanted Forest Chest", "Enchanted Forest Small Chest", "Samurai Island Chest", "Samurai Island Small Chest", "Candy Island Chest", "Candy Island Small Chest", "Hell Island Chest", 'Hell Island Small Chest', "Heaven Island Chest", 'Heaven Island Small Chest', "Axolotl Deep Ocean Chest", "Axolotl Deep Ocean Small Chest", "Pixel Forest Chest", 'Pixel Forest Small Chest', "Pixel Alps Chest", 'Pixel Alps Small Chest'}
  
  local PresentsMasteryList = {"Town Present", "Forest Present", "Beach Present", "Mine Present", "Desert Present", "Volcano Present", "Winter Present", "Glacier Present", "Enchanted Forest Present", "Ancient Island Present", "Samurai Island Present", "Candy Island Present", "Haunted Island Present", "Hell Island Present", "Heaven Island Present", "Tech City Present", "Dark Tech Present", "Alien Forest Present", "Blue Glitched Present", "Pink Glitched Present", "Axolotl Ocean Present", "Pixel Forest Present", "Pixel Kyoto Present", "Pixel Kyoto Large Present"}
  
  local VaultsSafesMasteryList = {"Forest Safe", "Forest Vault", "Beach Safe", "Beach Vault", "Mine Safe", "Mine Vault", "Desert Safe", "Desert Vault", "Volcano Safe", "Volcano Vault", "Winter Safe", "Winter Vault", "Glacier Safe", "Glacier Vault", "Enchanted Forest Safe", "Enchanted Forest Vault", "Ancient Island Vault", 'Ancient Island Safe', "Candy Island Vault", 'Candy Island Safe', "Haunted Island Vault", 'Haunted Island Safe', "Heaven Island Vault", 'Heaven Island Safe', "Tech City Vault", 'Tech City Safe', "Steampunk Vault", 'Steampunk Safe', "Alien Lab Vault", 'Alien Lab Safe', "Blue Glitched Vault", 'Blue Glitched Safe', "Pink Glitched Vault", 'Pink Glitched Safe', "Axolotl Deep Ocean Vault", 'Axolotl Deep Ocean Safe', "Pixel Forest Vault", 'Pixel Forest Safe', "Pixel Vault Safe", "Pixel Vault Vault"}

  local DiamondsMasteryList = {"Diamonds", "Tiny Diamonds"}
  local MasteryIndex = {"All", "Coins Piles Mastery", "Crates Mastery", "Chests Mastery", "Presents Mastery", "Vaults & Safes Mastery", "Diamonds Mastery"}

  spawn(function()
      while task.wait(FarmingSpeed) do
          if Mastery then
              pcall(function()
                  for i2, v2 in pairs(check["Mast"].Value) do
                      if v2 == "Crates Mastery" then
                          local CurrentFarmingPets = {}
                          local pethingy = GetMyPets()
                          for i,v in pairs(CratesMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                      elseif v2 == "All" then
                          local CurrentFarmingPets = {}
                          local pethingy = GetMyPets()
                          for i,v in pairs(CoinsPilesMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                          for i,v in pairs(DiamondsMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                          for i,v in pairs(VaultsSafesMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                          for i,v in pairs(ChestsMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                          for i,v in pairs(PresentsMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
  
  
                      elseif v2 == "Coins Piles Mastery" then
                          local CurrentFarmingPets = {}
                          local pethingy = GetMyPets()
                          for i,v in pairs(CoinsPilesMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                      elseif v2 == "Chests Mastery" then
                          local CurrentFarmingPets = {}
                          local pethingy = GetMyPets()
                          for i,v in pairs(ChestsMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                      elseif v2 == "Presents Mastery" then
                          local CurrentFarmingPets = {}
                          local pethingy = GetMyPets()
                          for i,v in pairs(PresentsMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                      elseif v2 == "Vaults & Safes Mastery" then
                          local CurrentFarmingPets = {}
                          local pethingy = GetMyPets()
                          for i,v in pairs(VaultsSafesMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                      elseif v2 == "Diamonds Mastery" then
                          local CurrentFarmingPets = {}
                          local pethingy = GetMyPets()
                          for i,v in pairs(DiamondsMastery()) do
                              if v.index%#pethingy == #pethingy-1 then wait() end
                              if not CurrentFarmingPets[pethingy[v.index%#pethingy+1]] or CurrentFarmingPets[pethingy[v.index%#pethingy+1]] == nil then
                                  if game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(v.index) then
                                      pcall(function()
                                          CurrentFarmingPets[pethingy[v.index%#pethingy+1]] = 'Farming'
                                          FarmCoin(v.index, pethingy[v.index%#pethingy+1])
                                      end)
                                  end
                              end
                          end
                      end
                  end
              end)
          end
      end
  end)
  
  function CratesMastery()
      local returntable = {}
      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
      for i,v in pairs(ListCoins) do
          local shit = v
          shit["index"] = i
          for aa,bb in pairs(CratesMasteryList) do
              if string.find(v.n, bb) then
                  local thing = string.gsub(v.n, bb.." ", " ")
                  if table.find(CratesMasteryList, thing) then
                      shit.n = thing
                      table.insert(returntable, shit)
                  end
              end
          end
      end
      return returntable
  end
  
  function CoinsPilesMastery()
      local returntable = {}
      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
      for i,v in pairs(ListCoins) do
          local shit = v
          shit["index"] = i
          for aa,bb in pairs(CoinsPilesMasteryList) do
              if string.find(v.n, bb) then
                  local thing = string.gsub(v.n, bb.." ", " ")
                  if table.find(CoinsPilesMasteryList, thing) then
                      shit.n = thing
                      table.insert(returntable, shit)
                  end
              end
          end
      end
      return returntable
  end
  
  function ChestsMastery()
      local returntable = {}
      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
      for i,v in pairs(ListCoins) do
          local shit = v
          shit["index"] = i
          for aa,bb in pairs(ChestsMasteryList) do
              if string.find(v.n, bb) then
                  local thing = string.gsub(v.n, bb.." ", " ")
                  if table.find(ChestsMasteryList, thing) then
                      shit.n = thing
                      table.insert(returntable, shit)
                  end
              end
          end
      end
      return returntable
  end
  
  function PresentsMastery()
      local returntable = {}
      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
      for i,v in pairs(ListCoins) do
          local shit = v
          shit["index"] = i
          for aa,bb in pairs(PresentsMasteryList) do
              if string.find(v.n, bb) then
                  local thing = string.gsub(v.n, bb.." ", " ")
                  if table.find(PresentsMasteryList, thing) then
                      shit.n = thing
                      table.insert(returntable, shit)
                  end
              end
          end
      end
      return returntable
  end
  
  function VaultsSafesMastery()
      local returntable = {}
      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
      for i,v in pairs(ListCoins) do
          local shit = v
          shit["index"] = i
          for aa,bb in pairs(VaultsSafesMasteryList) do
              if string.find(v.n, bb) then
                  local thing = string.gsub(v.n, bb.." ", " ")
                  if table.find(VaultsSafesMasteryList, thing) then
                      shit.n = thing
                      table.insert(returntable, shit)
                  end
              end
          end
      end
      return returntable
  end
  
  function DiamondsMastery()
      local returntable = {}
      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
      for i,v in pairs(ListCoins) do
          local shit = v
          shit["index"] = i
          for aa,bb in pairs(DiamondsMasteryList) do
              if string.find(v.n, bb) then
                  local thing = string.gsub(v.n, bb.." ", " ")
                  if table.find(DiamondsMasteryList, thing) then
                      shit.n = thing
                      table.insert(returntable, shit)
                  end
              end
          end
      end
      return returntable
  end

TabFarm:Toggle("Hide Coin Health", function(v)
          ShowHealt = v
end)
       spawn(function()
          while task.wait() do
              if ShowHealt then
                  pcall(function()
                      for i,v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetDescendants()) do
                          if v.Name == "HUD" then
                              v:Destroy()
                           end
                       end
                  end)
              end
          end
         end)

TabFarm:Toggle("Hide Coins", function(v)
    print(tostring(Bool))
end)
  
         spawn(function()
          while task.wait() do
              if ShowCoin then
                  pcall(function()
                      for i,v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetChildren()) do
                          v:Destroy()
                      end
                  end)
              end
          end
         end)

  function FarmCoin(CoinID, PetID)
      game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
      game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
   end
  
   spawn(function()
      while task.wait(FarmingSpeed) do
          if ChestFarm then
              pcall(function()
  
                  if fastoption then
                      for i2, v2 in pairs(check["chests"].Value) do
                      if v2 == 'All' then
                          local function FarmCoin(CoinID, PetID)
                              game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                              game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                           end
                      
                           local function GetPet()
                              local ReturnTable = {}
                                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                      if v.ClassName == "TextButton" and v.Equipped.Visible then
                                          table.insert(ReturnTable, v.Name)
                                      end
                                  end
                              return ReturnTable
                           end
          
                          local function GetCoins(chest)
                              local ReturnTable = {}
                              local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                              for i,v in pairs(ListCoins) do
                                  if v.n == 'Volcano Magma Chest' or
                                  v.n == "Ancient Island Enchanted Chest" or
                                  v.n == "Hell Island Hell Chest" or
                                  v.n == "Haunted Island Haunted Chest" or
                                  v.n == "Heaven Island Angel Chest" or
                                  v.n == "Heavens Gate Grand Heaven Chest" or
                                  v.n == "Giant Tech Chest" or
                                  v.n == "Giant Steampunk Chest" or
                                  v.n == "Giant Alien Chest" or
                                  v.n == "Giant Ocean Chest" or
                                  v.n == "Giant Present"
                                  then
                                      local Coin = v
                                      Coin["index"] = i
                                      table.insert(ReturnTable, Coin)
                                  end
                              end
                              return ReturnTable
                          end
          
                          local PetThiny = GetPet()
                          local Cointhiny = GetCoins()
          
                          for i = 1, #Cointhiny do
                              coroutine.wrap(function()
                              FarmCoin(Cointhiny[i].index, PetThiny[1])
                              FarmCoin(Cointhiny[i].index, PetThiny[2])
                              FarmCoin(Cointhiny[i].index, PetThiny[3])
                              FarmCoin(Cointhiny[i].index, PetThiny[4])
                              FarmCoin(Cointhiny[i].index, PetThiny[5])
                              FarmCoin(Cointhiny[i].index, PetThiny[6])
                              FarmCoin(Cointhiny[i].index, PetThiny[7])
                              FarmCoin(Cointhiny[i].index, PetThiny[8])
                              FarmCoin(Cointhiny[i].index, PetThiny[9])
                              FarmCoin(Cointhiny[i].index, PetThiny[10])
                              FarmCoin(Cointhiny[i].index, PetThiny[11])
                              FarmCoin(Cointhiny[i].index, PetThiny[12])
                              FarmCoin(Cointhiny[i].index, PetThiny[13])
                              FarmCoin(Cointhiny[i].index, PetThiny[14])
                              FarmCoin(Cointhiny[i].index, PetThiny[15])
                              FarmCoin(Cointhiny[i].index, PetThiny[16])
                              FarmCoin(Cointhiny[i].index, PetThiny[17])
                              FarmCoin(Cointhiny[i].index, PetThiny[18])
                              FarmCoin(Cointhiny[i].index, PetThiny[19])
                              FarmCoin(Cointhiny[i].index, PetThiny[20])
                              FarmCoin(Cointhiny[i].index, PetThiny[21])
                              FarmCoin(Cointhiny[i].index, PetThiny[22])
                              end)()
                          end
                      else
                          local function FarmCoin(CoinID, PetID)
                              game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                              game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                           end
                      
                           local function GetPet()
                              local ReturnTable = {}
                                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                      if v.ClassName == "TextButton" and v.Equipped.Visible then
                                          table.insert(ReturnTable, v.Name)
                                      end
                                  end
                              return ReturnTable
                           end
          
          
                          local function GetCoins(chest)
                              local ReturnTable = {}
                              local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                              for i,v in pairs(ListCoins) do
                                  for i2, v2 in pairs(check["chests"].Value) do
                                          if v.n == v2 then
                                          local Coin = v
                                          Coin["index"] = i
                                          table.insert(ReturnTable, Coin)
                                      end
                                  end
                              end
                              return ReturnTable
                          end
          
                          local PetThiny = GetPet()
                          local Cointhiny = GetCoins()
          
                          for i = 1, #Cointhiny do
                              coroutine.wrap(function()
                                FarmCoin(Cointhiny[i].index, PetThiny[1])
                                FarmCoin(Cointhiny[i].index, PetThiny[2])
                                FarmCoin(Cointhiny[i].index, PetThiny[3])
                                FarmCoin(Cointhiny[i].index, PetThiny[4])
                                FarmCoin(Cointhiny[i].index, PetThiny[5])
                                FarmCoin(Cointhiny[i].index, PetThiny[6])
                                FarmCoin(Cointhiny[i].index, PetThiny[7])
                                FarmCoin(Cointhiny[i].index, PetThiny[8])
                                FarmCoin(Cointhiny[i].index, PetThiny[9])
                                FarmCoin(Cointhiny[i].index, PetThiny[10])
                                FarmCoin(Cointhiny[i].index, PetThiny[11])
                                FarmCoin(Cointhiny[i].index, PetThiny[12])
                                FarmCoin(Cointhiny[i].index, PetThiny[13])
                                FarmCoin(Cointhiny[i].index, PetThiny[14])
                                FarmCoin(Cointhiny[i].index, PetThiny[15])
                                FarmCoin(Cointhiny[i].index, PetThiny[16])
                                FarmCoin(Cointhiny[i].index, PetThiny[17])
                                FarmCoin(Cointhiny[i].index, PetThiny[18])
                                FarmCoin(Cointhiny[i].index, PetThiny[19])
                                FarmCoin(Cointhiny[i].index, PetThiny[20])
                                FarmCoin(Cointhiny[i].index, PetThiny[21])
                                FarmCoin(Cointhiny[i].index, PetThiny[22])
                              end)()
                          end
                      end
                  end
              else
                  for i2, v2 in pairs(check["chests"].Value) do
                  if v2 == 'All' then
                      local function FarmCoin(CoinID, PetID)
                          game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                          game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                       end
                  
                       local function GetPet()
                          local ReturnTable = {}
                              for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                  if v.ClassName == "TextButton" and v.Equipped.Visible then
                                      table.insert(ReturnTable, v.Name)
                                  end
                              end
                          return ReturnTable
                       end
      
                      local function GetCoins(chest)
                          local ReturnTable = {}
                          local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                          for i,v in pairs(ListCoins) do
                              if v.n == 'Volcano Magma Chest' or
                              v.n == "Ancient Island Enchanted Chest" or
                              v.n == "Hell Island Hell Chest" or
                              v.n == "Haunted Island Haunted Chest" or
                              v.n == "Heaven Island Angel Chest" or
                              v.n == "Heavens Gate Grand Heaven Chest" or
                              v.n == "Giant Tech Chest" or
                              v.n == "Giant Steampunk Chest" or
                              v.n == "Giant Alien Chest" or
                              v.n == "Giant Ocean Chest" or
                              v.n == "Giant Present"
                              then
                                  local Coin = v
                                  Coin["index"] = i
                                  table.insert(ReturnTable, Coin)
                              end
                          end
                          return ReturnTable
                      end
      
                      local PetThiny = GetPet()
                      local Cointhiny = GetCoins()
      
                      for i = 1, #Cointhiny do
                        FarmCoin(Cointhiny[i].index, PetThiny[1])
                        FarmCoin(Cointhiny[i].index, PetThiny[2])
                        FarmCoin(Cointhiny[i].index, PetThiny[3])
                        FarmCoin(Cointhiny[i].index, PetThiny[4])
                        FarmCoin(Cointhiny[i].index, PetThiny[5])
                        FarmCoin(Cointhiny[i].index, PetThiny[6])
                        FarmCoin(Cointhiny[i].index, PetThiny[7])
                        FarmCoin(Cointhiny[i].index, PetThiny[8])
                        FarmCoin(Cointhiny[i].index, PetThiny[9])
                        FarmCoin(Cointhiny[i].index, PetThiny[10])
                        FarmCoin(Cointhiny[i].index, PetThiny[11])
                        FarmCoin(Cointhiny[i].index, PetThiny[12])
                        FarmCoin(Cointhiny[i].index, PetThiny[13])
                        FarmCoin(Cointhiny[i].index, PetThiny[14])
                        FarmCoin(Cointhiny[i].index, PetThiny[15])
                        FarmCoin(Cointhiny[i].index, PetThiny[16])
                        FarmCoin(Cointhiny[i].index, PetThiny[17])
                        FarmCoin(Cointhiny[i].index, PetThiny[18])
                        FarmCoin(Cointhiny[i].index, PetThiny[19])
                        FarmCoin(Cointhiny[i].index, PetThiny[20])
                        FarmCoin(Cointhiny[i].index, PetThiny[21])
                        FarmCoin(Cointhiny[i].index, PetThiny[22])
                      end
                  else
                      local function FarmCoin(CoinID, PetID)
                          game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                          game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                       end
                  
                       local function GetPet()
                          local ReturnTable = {}
                              for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                  if v.ClassName == "TextButton" and v.Equipped.Visible then
                                      table.insert(ReturnTable, v.Name)
                                  end
                              end
                          return ReturnTable
                       end
      
      
                      local function GetCoins(chest)
                          local ReturnTable = {}
                          local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                          for i,v in pairs(ListCoins) do
                          for i2, v2 in pairs(check["chests"].Value) do
                              if v.n == v2 then
                                  local Coin = v
                                  Coin["index"] = i
                                  table.insert(ReturnTable, Coin)
                              end
                          end
                          end
                          return ReturnTable
                      end
      
                      local PetThiny = GetPet()
                      local Cointhiny = GetCoins()
      
                      for i = 1, #Cointhiny do
                        FarmCoin(Cointhiny[i].index, PetThiny[1])
                        FarmCoin(Cointhiny[i].index, PetThiny[2])
                        FarmCoin(Cointhiny[i].index, PetThiny[3])
                        FarmCoin(Cointhiny[i].index, PetThiny[4])
                        FarmCoin(Cointhiny[i].index, PetThiny[5])
                        FarmCoin(Cointhiny[i].index, PetThiny[6])
                        FarmCoin(Cointhiny[i].index, PetThiny[7])
                        FarmCoin(Cointhiny[i].index, PetThiny[8])
                        FarmCoin(Cointhiny[i].index, PetThiny[9])
                        FarmCoin(Cointhiny[i].index, PetThiny[10])
                        FarmCoin(Cointhiny[i].index, PetThiny[11])
                        FarmCoin(Cointhiny[i].index, PetThiny[12])
                        FarmCoin(Cointhiny[i].index, PetThiny[13])
                        FarmCoin(Cointhiny[i].index, PetThiny[14])
                        FarmCoin(Cointhiny[i].index, PetThiny[15])
                        FarmCoin(Cointhiny[i].index, PetThiny[16])
                        FarmCoin(Cointhiny[i].index, PetThiny[17])
                        FarmCoin(Cointhiny[i].index, PetThiny[18])
                        FarmCoin(Cointhiny[i].index, PetThiny[19])
                        FarmCoin(Cointhiny[i].index, PetThiny[20])
                        FarmCoin(Cointhiny[i].index, PetThiny[21])
                        FarmCoin(Cointhiny[i].index, PetThiny[22])
                      end
                  end
                  end
              end
              end)
          end
      end
  end)
  
  
  spawn(function()
  while task.wait(FarmingSpeed) do
      if SettingsTable.GemFarm then 
      function getGemid()
          for i,v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetDescendants()) do
              if v:IsA"MeshPart" then
                  if v.MeshId == 'rbxassetid://7041620873' or v.MeshId == 'rbxassetid://7041621431' or v.MeshId == 'rbxassetid://7041621329' or v.MeshId == 'rbxassetid://7041620873' then
                      a = v.Parent.Name
                  end
              end
          end
          return a
      end
  
          
               function GetThePets2()
                  local returntable = {}
                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                      if v.ClassName == 'TextButton' and v.Equipped.Visible then
                          table.insert(returntable, v.Name)
                      end
                  end
                  return returntable
               end
               
               local GetMyPets = GetThePets2()
               
                   function FarmCoin65(CoinID, PetID)
                  game.workspace["__THINGS"]["__REMOTES"]["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                  game.workspace["__THINGS"]["__REMOTES"]["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                   end
          
          
          
          for i,v in pairs(GetMyPets) do
            pcall(function()
                FarmCoin65(getGemid(), v)
            end)
             end
          end
      end
      end)
  
  
      spawn(function()
          while task.wait(.6) do
              if FarmCoinHealth then
                  pcall(function()
                      function FarmCoin(CoinID, PetID)
                          game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                          game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})                
                      end
      
                      function GetPet()
                          local Returntable = {}
                              for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                  if v.ClassName == "TextButton" and v.Equipped.Visible then
                                      table.insert(Returntable, v.Name)
                                  end
                              end
                          return Returntable
                      end
      
                      local NearestCoin = tonumber(SelDistacne)
                      function GetCoins()
                          local Returntable = {}
                          local Areas = (areaTable)
                          local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                          for i,v in pairs(ListCoins) do
                              if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude < NearestCoin or v.h >= SelHealth then
                                  local Coin = v
                                  Coin["index"] = i
                                  table.insert(Returntable, Coin)
                                  NearestCoin = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude
                              end
                          end
                          return Returntable
                      end
      
                      local petthingy = GetPet()
      
                      local cointhiny = GetCoins()
      
                      for i = 1, #cointhiny do
                          coroutine.wrap(function()
                              FarmCoin(cointhiny[i].index, petthingy[i%#petthingy+1])
                          end)()
                      end
  
      end)
      end
      end
      end)
  
      --FarmSelectedCoin
  --SelectedArea
  spawn(function()
      while task.wait(FarmingSpeed) do
          if FarmSelectedCoin then
              pcall(function()
                  for i4, v4 in pairs(check["SelArea"].Value) do
                      if v4 == "All" then
                          local function FarmCoin(CoinID, PetID)
                              game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                              game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                           end
                      
                           local function GetPet()
                              local ReturnTable = {}
                                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                      if v.ClassName == "TextButton" and v.Equipped.Visible then
                                          table.insert(ReturnTable, v.Name)
                                      end
                                  end
                              return ReturnTable
                           end
          
                          local function GetCoins(area)
                              local ReturnTable = {}
                              local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                              for i,v in pairs(ListCoins) do
                                for i2, v2 in pairs(check["hope"].Value) do
                                  if v.n == "Town".. " ".. v2 or
                                  v.n == "Forest".. " ".. v2 or
                                  v.n == "Beach".. " ".. v2 or
                                  v.n == "Mine".. " ".. v2 or
                                  v.n == "Winter".. " ".. v2 or
                                  v.n == "Glacier".. " ".. v2 or
                                  v.n == "Desert".. " ".. v2 or
                                  v.n == "Volcano".. " ".. v2 or
                                  v.n == "Enchanted Forest".. " ".. v2 or
                                  v.n == "Ancient Island".. " ".. v2 or
                                  v.n == "Samurai Island".. " ".. v2 or
                                  v.n == "Candy Island".. " ".. v2 or
                                  v.n == "Haunted Island".. " ".. v2 or
                                  v.n == "Hell Island".. " ".. v2 or
                                  v.n == "Heaven Island".. " ".. v2 or
                                  v.n == "Ice Tech".. " ".. v2 or
                                  v.n == "Tech City".. " ".. v2 or
                                  v.n == "Dark Tech".. " ".. v2 or
                                  v.n == "Steampunk".. " ".. v2 or
                                  v.n == "Alien Lab".. " ".. v2 or
                                  v.n == "Alien Forest".. " ".. v2 or
                                  v.n == "Glitch".. " ".. v2 or
                                  v.n == "Hacker Portal".. " ".. v2 or
                                  v.n == "Axolotl Ocean".. " ".. v2 or
                                  v.n == "Axolotl Deep Ocean".. " ".. v2 or
                                  v.n == "Axolotl Cave".. " ".. v2
                                   then
                                      local Coin = v
                                      Coin["index"] = i
                                      table.insert(ReturnTable, Coin)
                                end
                                end
                              end
                              return ReturnTable
                          end
          
                          local PetThiny = GetPet()
                          local Cointhiny = GetCoins()
          
                          for i = 1, #Cointhiny do
                            coroutine.wrap(function()
                              FarmCoin(Cointhiny[i].index, PetThiny[i%#PetThiny+1])
                            end)()
                          end
  
                      else
  
                          local function FarmCoin(CoinID, PetID)
                              game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                              game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                           end
                      
                           local function GetPet()
                              local ReturnTable = {}
                                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                      if v.ClassName == "TextButton" and v.Equipped.Visible then
                                          table.insert(ReturnTable, v.Name)
                                      end
                                  end
                              return ReturnTable
                           end
          
                          local function GetCoins(area)
                              local ReturnTable = {}
                              local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                              for i,v in pairs(ListCoins) do
                                for i2, v2 in pairs(check["hope"].Value) do
                                    for i3, v3 in pairs(check["SelArea"].Value) do
                                  if v.n == v3.. " ".. v2 then
                                      local Coin = v
                                      Coin["index"] = i
                                      table.insert(ReturnTable, Coin)
                                  end
                                end
                                end
                              end
                              return ReturnTable
                          end
          
                          local PetThiny = GetPet()
                          local Cointhiny = GetCoins()
          
                          for i = 1, #Cointhiny do
                            coroutine.wrap(function()
                              FarmCoin(Cointhiny[i].index, PetThiny[i%#PetThiny+1])
                            end)()
                          end
                      end
                  end
  
  end)
  end
  end
  end)
       
  spawn(function()
      while task.wait(FarmingSpeed) do
          if SettingsTable.AreaFarm then
              pcall(function()
  
                          for i, v in pairs(check["SelArea"].Value) do
                              getgenv().Area = v
                          end
  
                          function FarmCoin(CoinID, PetID)
                              game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                              game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                              game:GetService("ReplicatedStorage").Framework.Modules["2 | Network"]["update coin pets"]:Fire(CoinID, {[1] = PetID})
                          end
                                   
                              function GetMyPets()
                              local returntable = {}
                              for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                  if v.ClassName == 'TextButton' and v.Equipped.Visible then
                                      table.insert(returntable, v.Name)
                                  end
                              end
                              return returntable
                              end
                      
                      function GetCoins()
                      local returntable = {}
                      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                      for i,v in pairs(ListCoins) do
                          if Area == "All" or string.find(string.lower(v.a), string.lower(Area)) then
                              table.insert(returntable, i)
                          end
                      end
                      return returntable
                      end
                      
                          local cointhiny = GetCoins()
                          local getpet = GetMyPets()
                          for i = 1, #cointhiny do
                              pcall(function() FarmCoin(cointhiny[i], getpet[i%#getpet+1]) end)
                          end
  
                          --[[
                          local function FarmCoin(CoinID, PetID)
                              game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                              game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                           end
                      
                           local function GetPet()
                              local ReturnTable = {}
                                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                      if v.ClassName == "TextButton" and v.Equipped.Visible then
                                          table.insert(ReturnTable, v.Name)
                                      end
                                  end
                              return ReturnTable
                           end
          
          
                          local function GetCoins()
                              local ReturnTable = {}
                              local AreaTable = (areaTable)
                              local ListCoins = workspace.__THINGS.__REMOTES["get coins"]:InvokeServer({})[1]
                              for i,v in pairs(ListCoins) do
                                  for i2, v2 in pairs(check["SelArea"].Value) do
                                  if v2 == "All" or v.a == v2 then
                                      local Coin = v
                                      Coin["index"] = i
                                      table.insert(ReturnTable, Coin)
                                  end
                              end
                              end
                              return ReturnTable
                          end
          
                          local PetThiny = GetPet()
                          local Cointhiny = GetCoins()
          
                          for i = 1, #Cointhiny do
                              FarmCoin(Cointhiny[i].index, PetThiny[i%#PetThiny+1])
                          end]]
              end)
          end
      end
  end)
  
  
  
  
  
  spawn(function()
      while task.wait(FarmingSpeed) do
          if UltraAreaFarm then
              pcall(function()
                      
                      for i, v in pairs(check["SelArea"].Value) do
                          getgenv().Area = v
                      end
          
                      function FarmCoin(CoinID, PetID)
                          game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                          game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                      end
                               
                          function GetMyPets()
                          local returntable = {}
                          for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                              if v.ClassName == 'TextButton' and v.Equipped.Visible then
                                  table.insert(returntable, v.Name)
                              end
                          end
                          return returntable
                          end
                  
                  function GetCoins()
                  local returntable = {}
                  local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                  for i,v in pairs(ListCoins) do
                      if Area == "All" or string.find(string.lower(v.a), string.lower(Area)) then
                          table.insert(returntable, i)
                      end
                  end
                  return returntable
                  end
                  
                      local cointhiny = GetCoins()
                      local getpet = GetMyPets()
                      for i = 1, #cointhiny do
                          coroutine.wrap(function()
                          pcall(function() FarmCoin(cointhiny[i], getpet[i%#getpet+1]) end)
                          end)()
                      end
              end)
          end
      end
  end)
  
                              function GetThePets540()
                                  local returntable = {}
                                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                      if v.ClassName == 'TextButton' and v.Equipped.Visible then
                                          table.insert(returntable, v.Name)
                                      end
                                  end
                                  return returntable
                               end
                          
                              
                              function FarmCoin2(CoinID, PetID)
                                  game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                                  game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                               end
                          
                              local pethingy2 = GetThePets540()
  
  spawn(function()
      while task.wait(FarmingSpeed) do
      if SettingsTable.FarmNearest then
          pcall(function()
  
              local nearest
              local NearestOne = tonumber(SelDistacne) or 307
              for i,v in pairs(game:GetService("Workspace")["__THINGS"].Coins:GetChildren()) do
                       if (v.POS.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < NearestOne then
                           nearest = v
                           NearestOne = (v.POS.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
           end
       end
  
      local Cointhiny2 = nearest.Name
      for i = 1, #Cointhiny2 do
          coroutine.wrap(function()
         FarmCoin2(Cointhiny2, pethingy2[i%#pethingy2+1])
  
      end)()
  end
      end)
          end
      end
  end)
  
  spawn(function()
      while game:GetService("RunService").Heartbeat:wait(FarmingSpeed) do
          if SettingsTable.MultiTarget then
              pcall(function()
  
                  function FarmCoin(CoinID, PetID)
                      game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                      game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})                
                  end
  
                  function GetPet()
                      local Returntable = {}
                          for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                              if v.ClassName == "TextButton" and v.Equipped.Visible then
                                  table.insert(Returntable, v.Name)
                              end
                          end
                      return Returntable
                  end
  
                  local NearestCoin = tonumber(SelDistacne) or 307
                  function GetCoins()
                      local Returntable = {}
                      local Areas = (areaTable)
                      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                      for i,v in pairs(ListCoins) do
                          if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude < NearestCoin then
                              local Coin = v
                              Coin["index"] = i
                              table.insert(Returntable, Coin)
                              NearestCoin = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.p).Magnitude
                          end
                      end
                      return Returntable
                  end
  
                  local petthingy = GetPet()
  
                  local cointhiny = GetCoins()
  
                  for i = 1, #cointhiny do
                      coroutine.wrap(function()
                          FarmCoin(cointhiny[i].index, petthingy[i%#petthingy+1])
                      end)()
                  end
              end)
          end
      end
     end)
  local TabFF = win:Tab("Fast")
  TabBuy:Toggle("Auto Redeam Rank Rewards", function(t)
         SettingsTable.RankRew = t
                         while wait(.3) do
                             if SettingsTable.RankRew then
     
                              workspace.__THINGS.__REMOTES["redeem rank rewards"]:InvokeServer({})
  end
     end
end)




TabFF:Button("FPS BOOST", function()
             
             local decalsyeeted = true
         local g = game
         local w = g.Workspace
         local l = g.Lighting
         local t = w.Terrain
         t.WaterWaveSize = 0
         t.WaterWaveSpeed = 0
         t.WaterReflectance = 0
         t.WaterTransparency = 0
         l.GlobalShadows = false
         l.FogEnd = 9e9
         l.Brightness = 0
         settings().Rendering.QualityLevel = "Level01"
         for i, v in pairs(g:GetDescendants()) do
             if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                 v.Material = "Plastic"
                 v.Reflectance = 0
             elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                 v.Transparency = 1
             elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                 v.Lifetime = NumberRange.new(0)
             elseif v:IsA("Explosion") then
                 v.BlastPressure = 1
                 v.BlastRadius = 1
             elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
                 v.Enabled = false
             elseif v:IsA("MeshPart") then
                 v.Material = "Plastic"
                 v.Reflectance = 0
                 v.TextureID = 10385902758728957
             end
         end
         for i, e in pairs(l:GetChildren()) do
             if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                 e.Enabled = false
             end
         end
end)


local TabFun = win:Tab("Fun")

TabFun:Button("Make All Pets Huge Santa", function()
    for i,v in pairs(game:GetService("Workspace")["__THINGS"].Pets:GetChildren()) do
        v.Mesh.MeshId = "rbxassetid://8211668957"
        v.Mesh.TextureId = "rbxassetid://8211668593"
        v.Mesh.Scale = Vector3.new(5, 5, 5)
    end
end)

TabFun:Button("Visual Gem Dupe", function()
    function comma_value(amount)
        local formatted = amount
       while true do  
          formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
          if (k == 0) then
            break
          end
        end
        return formatted
      end
  
      local diamonds = game.Players.LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount
      local old = diamonds.Text
      local oldNumber = string.gsub(old, ",", "")
      local newNumber = oldNumber * 10000
      local new = comma_value(newNumber)
      local newString = tostring(new)
      diamonds.Text = newString
end)
local TabUi = win:Tab("Ui's")

TabUi:Button("Bank", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Bank.Enabled = true
end)
TabUi:Button("Gold Pet Machine", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Golden.Enabled = true
end)
TabUi:Button("Rainbow Pet Machine", function()
 game:GetService("Players").LocalPlayer.PlayerGui.Rainbow.Enabled = true
end)
TabUi:Button("Fuse Pets", function()
  game:GetService("Players").LocalPlayer.PlayerGui.FusePets.Enabled = true
end)
TabUi:Button("Dark Matter Pet Machine", function()
    game:GetService("Players").LocalPlayer.PlayerGui.DarkMatter.Enabled = true
end)
TabUi:Button("Teleport", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Teleport.Enabled = true
end)
TabUi:Button("Merchant", function()
	game:GetService("Players").LocalPlayer.PlayerGui.Merchant.Enabled = true
end)
local TabAB = win:Tab("Boost")

TabAB:Toggle("Auto Use Triple Damage Boost", function(state)
         if state then
             function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
     
     local args = {
         [1] = {
             [1] = "Triple Damage"
         }
     }
     
     workspace.__THINGS.__REMOTES:FindFirstChild("activate boost"):FireServer(unpack(args))
     
             getgenv().hahj = true;
             
             while wait(1200) do
                 if getgenv().hahj == true then
             function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
     
     local args = {
         [1] = {
             [1] = "Triple Damage"
         }
     }
     
     workspace.__THINGS.__REMOTES:FindFirstChild("activate boost"):FireServer(unpack(args))
     
             end
             end
                 else
                     function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
     
     local args = {
         [1] = {
             [1] = "Triple Damage"
         }
     }
     
     workspace.__THINGS.__REMOTES:FindFirstChild("activate boost"):FireServer(unpack(args))
     
                     getgenv().hahj = false;
                     
                     while wait(1200) do
                         if getgenv().hahj == true then
                     function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
                     
     local args = {
         [1] = {
             [1] = "Triple Damage"
         }
     }
     
     workspace.__THINGS.__REMOTES:FindFirstChild("activate boost"):FireServer(unpack(args))
     
                     end
                     end
                 end
     end)
     
TabAB:Toggle("Auto Use Triple Coin Boost", function(state)
             if state then
              function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
  
              local args = {
                  [1] = {
                      [1] = "Triple Coins",
                  },
              }
              
              workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
              getgenv().hahj = true;
              
              while wait(1200) do
                  if getgenv().hahj == true then
              function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
              
              local args = {
                  [1] = {
                      [1] = "Triple Coins",
                  },
              }
              
              workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
              end
              end
                     else
                      function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
  
                      local args = {
                          [1] = {
                              [1] = "Triple Coins",
                          },
                      }
                      
                      workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
                      getgenv().hahj = false;
                      
                      while wait(1200) do
                          if getgenv().hahj == true then
                      function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
                      
                      local args = {
                          [1] = {
                              [1] = "Triple Coins",
                          },
                      }
                      
                      workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
                      end
                      end
                     end
end)


  local pathToScript = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Open Eggs']
  local oldFunc = getsenv(pathToScript).OpenEgg

local TabEgg = win:Tab("Egg(Fixed)")
        local EggTable = {'All'} 
         for i,v in pairs(game.ReplicatedStorage.Game.Eggs:GetChildren()) do 
             for i2,v2 in pairs(v:GetChildren()) do 
                 table.insert(EggTable, v2.Name)
             end 
         end
  
local ScriptPathh = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Open Eggs']
local OldFunction = getsenv(ScriptPathh).OpenEgg
  TabEgg:Toggle("Remove egg opening animation", function(delanimation)
            if delanimation == true then 
        getsenv(ScriptPathh).OpenEgg = function() return end 
    else
        getsenv(ScriptPathh).OpenEgg = OldFunction
    end
end)

TabEgg:Dropdown("Select Egg", EggTable, function() return end)

         game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.ChildAdded:Connect(function(child)
          if child.Name ~= "Empty" then
              current = current + 1
          end
      end)

      spawn(function()
          while task.wait() do
              pcall(function()
                  EggCount:Refresh("Eggs Opened: "..current)
              end)
          end
         end)


TabEgg:Toggle("Open Egg", function(startegss)
         start = startegss
         while start do task.wait()
          for i,v in pairs(check["SelEg"].Value) do
              if v == "All" then
                  for b,a in pairs(game.ReplicatedStorage.Game.Eggs:GetChildren()) do 
                      for i2,v2 in pairs(a:GetChildren()) do 
                          local args = {
                              [1] = {
                                  [1] = v2.Name,
                                  [2] = start2
                              }
                           }
                           workspace.__THINGS.__REMOTES:FindFirstChild("buy egg"):InvokeServer(unpack(args))
          
                      end 
                  end          
              else
                  local args = {
                      [1] = {
                          [1] = v,
                          [2] = start2
                      }
                   }
                   workspace.__THINGS.__REMOTES:FindFirstChild("buy egg"):InvokeServer(unpack(args))
            
              end
          end
         end
end)


 TabEgg:Toggle("Triple Open Eggs (Gamepass Needed)", function(t)
     start2 = t
 end)

 TabEgg:Toggle("Auto Open inv", function(t)
            open_5_min_inv = t
            while open_5_min_inv do task.wait()
                game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Enabled = true 
                wait(.8)
                game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Enabled = false
                wait(Sel_Time_Open_Inv*60) -- this is 5 min
            end
 end)

TabEgg:Slider("Select Time (Auto Open Inv)", 1, 10, 2, function(v)
            Sel_Time_Open_Inv = v
end)

 TabEgg:Toggle("Auto Use Super Luck!", function(v)
    function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
     UseSperLuck = v
     while UseSperLuck do task.wait()
    local args = {
        [1] = {
            [1] = "Super Lucky",
        },
    }
    
    workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
    task.wait(1199)
     end
 end)

 TabEgg:Toggle("Auto Use ULTRA Luck!", function(v)
       function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
        UseUltraLuck = v
        while UseUltraLuck do task.wait()
       local args = {
           [1] = {
               [1] = "Ultra Lucky",
           },
       }
       
       workspace["__THINGS"]["__REMOTES"]["activate boost"]:FireServer(unpack(args))
       task.wait(899)
        end
 end)

TabEgg:Label("Upgrade")


 TabEgg:Toggle("Auto Upgrade Pet Storage", function(t)
      getgenv().PetStorage = t
      while wait() do
          if getgenv().PetStorage == true then
      local args = {
          [1] = {
              [1] = "Pet Storage"
          }
      }
      workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))
      
          end
      end
 end)

 TabEgg:Toggle("Auto Upgrade walkspeed", function(t)
          getgenv().walkspeed = t
          while wait() do
              if getgenv().walkspeed == true then
  
  local args = {
      [1] = {
          [1] = "Player Walkspeed"
      }
  }
  
  workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))
  
              end
          end
 end)

  TabEgg:Toggle("Auto Upgrade Orbs Reach", function(t)
              getgenv().walksorbreachpeed = t
              while wait() do
                  if getgenv().orbreach == true then
      
  local args = {
      [1] = {
          [1] = "Orb Pickup Distance"
      }
  }
  
  workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))
  
                  end
              end
 end)

  TabEgg:Toggle("Auto Upgrade More Diamonds", function(t)
                  getgenv().morediamonds = t
                  while wait() do
                      if getgenv().morediamonds == true then
  local args = {
      [1] = {
          [1] = "More Diamonds"
      }
  }
  
  workspace.__THINGS.__REMOTES:FindFirstChild("buy upgrade"):InvokeServer(unpack(args))
  
                      end
                  end
                  end)
  local Network = GameLibrary.Network
  local Run_Service = game:GetService("RunService")
  local rs = Run_Service.RenderStepped
  local IDToName = {}
  local NameToID = {}
  local PettoRarity = {}
  local RarityTable = {}
  local PetNamesTable = {}
  local PetNamesTable = {}
  
  local IDToName = {}
  local NameToID = {}
  for i,v in pairs(Library.Directory.Pets ) do
      IDToName[i] = v.name
      NameToID[v.name] = i
  end   
  
  function GetMyPets()
         local returntable = {}
         for i,v in pairs(GameLibrary.Save.Get().Pets) do
             if v.e then 
                 table.insert(returntable, v.uid)
             end
         end
         return returntable
      end
  
  
  
  function GetPets()
      local MyPets = {}
      for i,v in pairs(GameLibrary.Save.Get().Pets) do
              local ThingyThingyTempTypeThing = (v.g and 'Gold') or (v.r and 'Rainbow') or (v.dm and 'Dark Matter') or 'Normal'
              local TempString = ThingyThingyTempTypeThing .. IDToName[v.id]
              if MyPets[TempString] then
                  table.insert(MyPets[TempString], v.uid)
              else
                  MyPets[TempString] = {}
                  table.insert(MyPets[TempString], v.uid)
              end
          end
      return MyPets
  end
  
  for i,v in pairs(GameLibrary.Directory.Pets) do
      IDToName[i] = v.name
      NameToID[v.name] = i
      PettoRarity[i] = v.rarity
      if not table.find(RarityTable, v.rarity) then
          table.insert(RarityTable, v.rarity)
      end
      table.insert(PetNamesTable, v.name)
  end

local TabPets = win:Tab("Pets")

TabPets:Slider("Select pet amount", 0, 6, 1, function(countcombinefunc)
          if countcombinefunc then
          getgenv().CountCombineFunc1 = countcombinefunc
      end
      print("Selected Combine Count: ", getgenv().CountCombineFunc1)
end)

TabPets:Toggle("Auto golden", function(togglegoldfunc)
  if togglegoldfunc == true then
      getgenv().ToggleGold = true
  elseif togglegoldfunc == false then
      getgenv().ToggleGold = false
  end
end)
TabPets:Toggle("Auto rainbow", function(toggleraibowfunc)
  if toggleraibowfunc == true then
      getgenv().ToggleRainbow = true
  elseif toggleraibowfunc == false then
      getgenv().ToggleRainbow = false
  end
end)
TabPets:Toggle("Enable Auto Golden / Rainbow", function(autocombinefunc)
      
      if autocombinefunc == true then
         getgenv().AutoCom = true
      elseif autocombinefunc == false then
          getgenv().AutoCom = false
      end
      
      while wait() and getgenv().AutoCom do
          for i, v in pairs(GetPets()) do
              if #v >= getgenv().CountCombineFunc1 and getgenv().AutoCom then
                  if string.find(i, "Normal") and getgenv().AutoCom and getgenv().ToggleGold then
                      local Args = {}
                      for eeeee = 1, getgenv().CountCombineFunc1 do
                          Args[#Args+1] = v[#Args+1]
                      end
                      Library.Network.Invoke("use golden machine", Args)
      
                  elseif string.find(i, "Gold") and getgenv().AutoCom and getgenv().ToggleRainbow then
                      local Args = {}
                      for eeeee = 1, getgenv().CountCombineFunc1 do
                          Args[#Args+1] = v[#Args+1]
                      end
                      Library.Network.Invoke("use rainbow machine", Args)
                  end
              end
          end
      end
      
      spawn(function()
          while wait() and getgenv().AutoCom do
              if not getgenv().ToggleGold and not getgenv().ToggleRainbow then 
                  repeat wait(1) until getgenv().ToggleGold or getgenv().ToggleRainbow
              end
              if tonumber(getgenv().CountCombineFunc1) == nil then
                  repeat wait() until tonumber(getgenv().CountCombineFunc1) ~= nil
              end
              for i, v in pairs(GetPets()) do
                  if #v >= getgenv().CountCombineFunc1 and (getgenv().ToggleGold or getgenv().ToggleRainbow) then
                      if string.find(i, "Normal") and getgenv().ToggleGold then
                          local Args = {}
                          for eeeee = 1, getgenv().CountCombineFunc1 do
                              Args[#Args+1] = v[#Args+1]
                          end
                         GameLibrary.Network.Invoke("use golden machine", Args)
                     elseif string.find(i, "Gold") and getgenv().ToggleRainbow then
                          local Args = {}
                          for eeeee = 1, getgenv().CountCombineFunc1 do
                              Args[#Args+1] = v[#Args+1]
                         end
                      GameLibrary.Network.Invoke("use rainbow machine", Args)
                      end
                  end
              end
          end
      end)
end)


    local FusePets_Table = {"All"}
    for i,v in pairs(Library.Directory.Pets) do
        table.insert(FusePets_Table, v.name)
    end

TabPets:Dropdown("Select Pets Fuse", FusePets_Table, function(t)

end)

 local TypeListFuse = {"Normal"; "Gold"; "Rainbow"; "Dark Matter";}

TabPets:Dropdown("Pet Rarity Type of", TypeListFuse, function(t)

end)

TabPets:Slider("Amount Of Pets To Fuse", 3, 12, 3, function(t)
   FusePetsAmmount = t
end)


TabPets:Toggle("Auto Fuse", function(t)
    StartAutoFuse = t
end)

TabPets:Toggle("Allow Hardcore Pets", function(t)
    AllowHCPetsFuse = t
end)

  function hasenchant(tbl, value)
    for i,v in pairs(tbl) do
        if v == value then
            return true 
        end
    end
    return false
end

  spawn(function()
    while task.wait() do
        if StartAutoFuse then
            pcall(function()

                
                -- local petsammount = FusePetsAmmount
                -- local PetId = -1
                
            for i2pog,v2pog in pairs(checklists["selFusePet"].Value) do
                if v2pog == "All" then
                    local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"))
                    local NameID = {}
                    for i,v in pairs(Library.Directory.Pets) do
                        NameID[i] = v.name
                    end
                        
                    
                        local selectedpets = {}
                            for i,v in pairs(Library.Save.Get().Pets) do
                            local prarity = Library.PetCmds.Get(v.uid)
                                            local PetRaito = (v.g and 'Gold') or (v.r and 'Rainbow') or (v.dm and 'Dark Matter') or 'Normal'
                                            local PetRaito2 = (v.g) or (v.r) or (v.dm)
                                            local PetRaito3 = v.g or v.r or v.dm
                    
                                            local PetSting = PetRaito .. NameID[v.id]
                                            if selectedpets[PetSting] then
                                                table.insert(selectedpets[PetSting], v.uid)
                                            else
                                                selectedpets[PetSting] = {}
                                                table.insert(selectedpets[PetSting], v.uid)
                                            end
                                end
                    
                            -- local PetRaito = 'Gold' or 'Rainbow' or 'Dark Matter' or 'Normal'
                            local PP
                            for i2,v2 in pairs(selectedpets) do
                                PP = {}
                                if string.find(i2, "Rainbow") or string.find(i2, "Gold") or string.find(i2, "Dark Matter") or string.find(i2, "Normal") then
                                    for i = 1,FusePetsAmmount do
                                        PP[#PP+1] = v2[#PP+1]
                                    end
                                    if (#PP == FusePetsAmmount) then
                                        workspace.__THINGS.__REMOTES["fuse pets"]:InvokeServer({PP})
                                    end
                                    end
                            end

                else
                    for i69,v69 in pairs(Library.Directory.Pets) do
                        if v2pog == v69.name then
                            local selectedpets = {}
                        for i,v in pairs(Library.Save.Get().Pets) do
                        local prarity = Library.PetCmds.Get(v.uid)
                            if not (#selectedpets == FusePetsAmmount) then
                                if (v.id == (i69)) then
                                    for i2, v2 in pairs(checklists["prto"].Value) do
                                        if AllowHCPetsFuse then
                                            if (v2 == "Normal" and not prarity.r and not prarity.g and not prarity.dm and prarity.hc ) or (prarity.r and v2 == "Rainbow") or (prarity.g and v2 == "Gold") or (prarity.dm and v2 == "Dark Matter") then
                                                table.insert(selectedpets, v.uid)
                                            end
                                        end
                                        
                                        if (v2 == "Normal" and not prarity.r and not prarity.g and not prarity.dm and not prarity.hc ) or (prarity.r and v2 == "Rainbow") or (prarity.g and v2 == "Gold") or (prarity.dm and v2 == "Dark Matter") then
                                            table.insert(selectedpets, v.uid)
                                        end

                                    end
                                    end
                                end
                            end
                            if (#selectedpets == FusePetsAmmount) then
                                workspace.__THINGS.__REMOTES["fuse pets"]:InvokeServer({selectedpets})
                            end
                            ---
                        end
                    end
                end
            end
            end)
        end
    end
  end)


TabPets:Toggle("Auto Claim Dark Matter Pets", function(autoclaimdark)

  if autoclaimdark == true then
      _G.AutoClaimDarkMatter = true
  elseif autoclaimdark == false then
      _G.AutoClaimDarkMatter = false
  end
      
  spawn(function()
      while task.wait() and _G.AutoClaimDarkMatter do
          for i,v in pairs(GameLibrary.Save.Get().DarkMatterQueue) do
              if math.floor(v.readyTime - os.time()) < 0 then
                  workspace.__THINGS.__REMOTES["redeem dark matter pet"]:InvokeServer({[1] = i})
              end
              end
          task.wait(15)
      end
  end)
end)

TabPets:Dropdown("Select Pet DarkMatter", FusePets_Table, function(t)

end)

TabPets:Slider("Pet Amount DarkMatter", 1, 6, 1, function(t)
    SelectDMAmount = t
end)

TabPets:Toggle("Auto Convert DarkMatter", function(autoclaimdark)
    StartDarkMatterConverter = t
end)

 spawn(function()
    while task.wait() do
        if StartDarkMatterConverter then
            pcall(function()
                local PetsTable = {}
                local PetId = -1
                
                for i4, v4 in pairs(checklists["selSPDmatter"].Value) do
                for i6,v6 in pairs(lib.Directory.Pets) do
                    if v4 == v6.name then
              
                for i,v in pairs(lib.Save.Get().Pets) do
                    local prarity = lib.PetCmds.Get(v.uid)
                    if not (#PetsTable == (SelectDMAmount)) then
                        if v.id == i6 then
                            if prarity.r then
                                table.insert(PetsTable, v.uid)
                            end
                        end
                    end
                end
                ---
              end
              end
              end
                
                workspace.__THINGS.__REMOTES["convert to dark matter"]:InvokeServer({PetsTable})
            end)
        end
    end
  end)
  



   

--   local enchants = {
--       'Magnet',
--       'Royalty',
--       'Glittering',
--       'Tech Coins',
--       'Fantasy Coins',
--       'Rainbow Coins',
--       'Coins',
--       'Teamwork',
--       'Diamonds',
--       'Strength',
--       'Chests',
--       'Presents',
--       'Agility',
--       'Charm'
--   }

local enchantis = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Directory.Powers:GetChildren()) do
    local powernames = string.gsub(v.Name, "Power -- ", "")
    table.insert(enchantis, powernames)
end


TabPets:Toggle("Start Enchanting", function(t)
      StartChant = t 
end)


local enchants = {
    'Magnet',
    'Royalty',
    'Glittering',
    'Tech Coins',
    'Fantasy Coins',
    'Rainbow Coins',
    'Coins',
    'Teamwork',
    'Diamonds',
    'Strength',
    'Chests',
    'Presents',
    'Agility',
    'Charm',
}


TabFarm:Dropdown("Select Enchant", enchantis, function(t)
  PowerName = t 
end)

TabFarm:Slider("Select Enchant Level", 1, 6, 1, function(t)
  PowerLevel = t 
end)

function hasInput(tbl, value)
  for i,v in pairs(tbl) do
      if v == value then
          return true
      end
  end
  return false 
end

function hasValue(tbl, value)
  for i,v in pairs(tbl) do
      if i == value then
          return true 
      end
  end
return false
end

spawn(function()
  while task.wait() do
      if StartChant then
          pcall(function()
              if PowerName == "Royalty" or PowerName == "Magnet" or PowerName == "Charm" or PowerName == "Teamwork" or PowerName == "Glittering" then
              for i,v in pairs(lib.Save.Get().Pets) do
                  local getpvalue = lib.PetCmds.Get(v.uid)
                  if getpvalue.e then
                      if hasValue(getpvalue, "powers") then
                      for i2,v2 in pairs(getpvalue.powers) do
                          if hasInput(v2, PowerName)  then
                          else
                              workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({v.uid})
                          end
                      end
                      else
                          workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({v.uid})
                      end
                  end
              end
              else
              for i,v in pairs(lib.Save.Get().Pets) do
                  local getpvalue = lib.PetCmds.Get(v.uid)
                  if getpvalue.e then
                      if hasValue(getpvalue, "powers") then
                      for i2,v2 in pairs(getpvalue.powers) do
                          if hasInput(v2, PowerLevel) and hasInput(v2, PowerName)  then --hasInput(v, "Strength") and
                          else
                              workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({v.uid})
                          end
                      end
                      else
                          workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({v.uid})
                      end
                  end
              end 
              end
          end) 
      end
  end
end)


TabPets:TextBox("Enter New Pet Name", function(t)
    selpname = t
end)


TabFarm:Button("Rename All Pets (ONLY CLICK ONCE!)", function()
    spawn(function()
        pcall(function()
		ArgetnarLib:Notify("System", "Renaming Pets \n please be patient!")
        end)
end)

    for i,v in pairs(Library.Save.Get().Pets) do
        if v.nk ~= selpname then
            -- print(v.uid)
            local scriptEnvironment = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.GUIs.Rename)
            scriptEnvironment.Rename(v.uid, selpname)
            task.wait(.87)
        end
    end
   end)
  
   local v1 = {};
   for i,v in pairs(Library.Directory.Pets) do
    for i,v in pairs(v) do
        if i == "name" then
            table.insert(v1, v)
        end
    end
end
  
TabPets:Dropdown("Select Pet", v1, function(petname)
  PetNamehere = petname
end)



















local TabMisc = win:Tab("Misc")
TabMisc:Button("Rejoin", function()
          local ts = game:GetService("TeleportService")
          local p = game:GetService("Players").LocalPlayer
          ts:Teleport(game.PlaceId, p)
end)
TabMisc:Slider("Walk Speed", 16, 500, 50, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)
TabMisc:Button("Destroy", function()
    game.CoreGui.MangoHub:Destroy();
end)
local TabCredit = win:Tab("Credits")
TabCredit:Label("Hub by Argetnar & Doku & Brinen")
local LabelRef = TabCredit:Label("v2.8")
TabCredit:Label("AutoFarm has been patched")

      for i,imaegg in pairs(game:GetService("ReplicatedStorage").Game.Coins:GetChildren()) do 
          for nu,hwe in pairs(imaegg:GetChildren()) do
              OldFarm:Toggle(hwe.Name, false, function(t)
                  StartOldFarm = t
                  while StartOldFarm do task.wait()
                      if send_All_Pets then
                          function FarmCoin(CoinID, PetID)
                              game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                              game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                          end
                                   
                              function GetMyPets()
                              local returntable = {}
                              for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                  if v.ClassName == 'TextButton' and v.Equipped.Visible then
                                      table.insert(returntable, v.Name)
                                  end
                              end
                              return returntable
                              end
                              
                      function GetCoins()
                      local returntable = {}
                      local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                      for i,v in pairs(ListCoins) do
                          if string.find(string.lower(v.a), string.lower(hwe.Name)) then
                              table.insert(returntable, i)
                          end
                      end
                      return returntable
                      end
                      
                          local cointhiny = GetCoins()
                          local getpet = GetMyPets()
                          for i = 1, #cointhiny do
                              coroutine.wrap(function()
                                  FarmCoin(cointhiny[i].index, getpet[1])
                                  FarmCoin(cointhiny[i].index, getpet[2])
                                  FarmCoin(cointhiny[i].index, getpet[3])
                                  FarmCoin(cointhiny[i].index, getpet[4])
                                  FarmCoin(cointhiny[i].index, getpet[5])
                                  FarmCoin(cointhiny[i].index, getpet[6])
                                  FarmCoin(cointhiny[i].index, getpet[7])
                                  FarmCoin(cointhiny[i].index, getpet[8])
                                  FarmCoin(cointhiny[i].index, getpet[9])
                                  FarmCoin(cointhiny[i].index, getpet[10])
                                  FarmCoin(cointhiny[i].index, getpet[11])
                                  FarmCoin(cointhiny[i].index, getpet[12])
                                  FarmCoin(cointhiny[i].index, getpet[13])
                                  FarmCoin(cointhiny[i].index, getpet[14])
                                  FarmCoin(cointhiny[i].index, getpet[15])
                                  FarmCoin(cointhiny[i].index, getpet[16])
                                  FarmCoin(cointhiny[i].index, getpet[17])
                                  FarmCoin(cointhiny[i].index, getpet[18])
                                  FarmCoin(cointhiny[i].index, getpet[19])
                                  FarmCoin(cointhiny[i].index, getpet[20])
                                  FarmCoin(cointhiny[i].index, getpet[21])
                                  FarmCoin(cointhiny[i].index, getpet[22])
                              end)()
                          end
                      else
                          pcall(function()
                              function FarmCoin(CoinID, PetID)
                                  game.workspace['__THINGS']['__REMOTES']["join coin"]:InvokeServer({[1] = CoinID, [2] = {[1] = PetID}})
                                  game.workspace['__THINGS']['__REMOTES']["farm coin"]:FireServer({[1] = CoinID, [2] = PetID})
                              end
                                       
                                  function GetMyPets()
                                  local returntable = {}
                                  for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
                                      if v.ClassName == 'TextButton' and v.Equipped.Visible then
                                          table.insert(returntable, v.Name)
                                      end
                                  end
                                  return returntable
                                  end
                                  
                          function GetCoins()
                          local returntable = {}
                          local ListCoins = game.workspace['__THINGS']['__REMOTES']["get coins"]:InvokeServer({})[1]
                          for i,v in pairs(ListCoins) do
                              if string.find(string.lower(v.a), string.lower(hwe.Name)) then
                                  table.insert(returntable, i)
                              end
                          end
                          return returntable
                          end
                          
                              local cointhiny = GetCoins()
                              local getpet = GetMyPets()
                              for i = 1, #cointhiny do
                                  coroutine.wrap(function()
                                      pcall(function() FarmCoin(cointhiny[i], getpet[i%#getpet+1]) end)
                                      task.wait(.3)
                                  end)()
                              end
                          
                          end)
                      end
                  end
              end)
          end
      end


















ArgetnarLib:Notify("Script", "Was Loaded!")
wait(10)
ArgetnarLib:Notify("Script", "AutoFarm has been patched")
