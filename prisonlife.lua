local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fraktured GUI", "DarkTheme")
--loadstring(game:HttpGet("https://pastebin.com/raw/cBQNJm4W"))() 
local Player = Window:NewTab("Player")
local PLife = Window:NewTab("Prison Life")
local Settings = Window:NewTab("Settings")

local PlayerSection = Player:NewSection("Movement")
local WeaponsSection = PLife:NewSection("Weapons")

local plr = game.Players.LocalPlayer

PlayerSection:NewSlider("Walkspeed", "Sets your walking speed.", 240, 0, function(v)
    plr.Character.Humanoid.WalkSpeed = v
end)
PlayerSection:NewSlider("Jump Height", "Sets your jump height.", 240, 0, function(v)
    plr.Character.Humanoid.JumpPower = v
end)
PlayerSection:NewButton("Walk on walls", "Allows you to walk on walls", function() 
    loadstring(game:HttpGet("https://pastebin.com/raw/5T7KsEWy", true))()
end)
PlayerSection:NewButton("Fly", "Makes you fly", function() 
    plr.Character.Humanoid.HipHeight = 10  -- Change to any value
    plr.Character.Humanoid.JumpPower = 100
    plr.Character.Humanoid.WalkSpeed = 100
end)

-- local ohInstance1 = workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP

-- workspace.Remote.ItemHandlesdr:InvokeServer(ohInstance1)

-- Weapons Section
WeaponsSection:NewDropdown("Weapon Giver", "Gives you the desired weapon", {"Remington 870", "AK-47", "M9"}, function(v)
    local ohInstance1 = workspace.Prison_ITEMS.giver[v].ITEMPICKUP

    workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
end)

WeaponsSection:NewDropdown("Weapon Mod", "Mods the weapon you selected to make it OP", {"Remington 870", "AK-47", "M9"}, function(v)
    local module
    if plr:WaitForChild("Backpack")[v] then
        module = require(plr:WaitForChild("Backpack")[v].GunStates)
        module["MaxAmmo"] = math.huge 
        module["StoredAmmo"] = math.huge 
        module["CurrentAmmo"] = math.huge 
        module["Damage"] = 500
        module["FireRate"] = 0.005
        module["ReloadTime"] = 0.4
        module["Bullets"] = 4
    end
end)
