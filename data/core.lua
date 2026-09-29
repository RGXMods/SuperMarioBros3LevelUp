--=====================================================================================
-- SMB3LU | SuperMarioBros3LevelUp - core.lua
-- Version: 2.0.0
-- Author: DonnieDice
-- RGX Mods Collection - RealmGX Community Project
--=====================================================================================

local RGX = assert(_G.RGXFramework, "SMB3LU: RGX-Framework not loaded")

SMB3LU = SMB3LU or {}

local ADDON_VERSION = "2.0.4"
local ADDON_NAME = "SuperMarioBros3LevelUp"
local PREFIX = "|Tinterface/addons/SuperMarioBros3LevelUp/media/icon:16:16|t - |cffffffff[|r|cffc24e37SMB3LU|r|cffffffff]|r "
local TITLE = "|Tinterface/addons/SuperMarioBros3LevelUp/media/icon:18:18|t [|cffc24e37S|r|cffffffffuper Mario Bros. 3|r |cffc24e37L|r|cffffffffevel|r |cffc24e37U|r|cffc24e37p|r|cffc24e37!|r]"

SMB3LU.version = ADDON_VERSION
SMB3LU.addonName = ADDON_NAME

local Sound = RGX:GetSound()

local handle = Sound:Register(ADDON_NAME, {
sounds = {
high = "Interface\\Addons\\SuperMarioBros3LevelUp\\sounds\\super_mario_bros_3_high.ogg",
medium = "Interface\\Addons\\SuperMarioBros3LevelUp\\sounds\\super_mario_bros_3_med.ogg",
low = "Interface\\Addons\\SuperMarioBros3LevelUp\\sounds\\super_mario_bros_3_low.ogg",
},
defaultSoundId = 569593,
savedVar = "SMB3LUSettings",
defaults = {
enabled = true,
soundVariant = "medium",
muteDefault = true,
showWelcome = true,
volume = "Master",
firstRun = true,
},
triggerEvent = "PLAYER_LEVEL_UP",
addonVersion = ADDON_VERSION,
})

SMB3LU.handle = handle

local L = SMB3LU.L or {}
local initialized = false

local function ShowHelp()
print(PREFIX .. " " .. (L["HELP_HEADER"] or ""))
print(PREFIX .. " " .. (L["HELP_TEST"] or ""))
print(PREFIX .. " " .. (L["HELP_ENABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_DISABLE"] or ""))
print(PREFIX .. " " .. (L["HELP_HIGH"] or "|cffffffff/smb3lu high|r - Use high quality sound"))
print(PREFIX .. " " .. (L["HELP_MEDIUM"] or "|cffffffff/smb3lu med|r - Use medium quality sound"))
print(PREFIX .. " " .. (L["HELP_LOW"] or "|cffffffff/smb3lu low|r - Use low quality sound"))
end

local function HandleSlashCommand(args)
local command = string.lower(args or "")
if command == "" or command == "help" then
ShowHelp()
elseif command == "test" then
print(PREFIX .. " " .. (L["PLAYING_TEST"] or ""))
handle:Test()
elseif command == "enable" then
handle:Enable()
print(PREFIX .. " " .. (L["ADDON_ENABLED"] or ""))
elseif command == "disable" then
handle:Disable()
print(PREFIX .. " " .. (L["ADDON_DISABLED"] or ""))
elseif command == "high" then
handle:SetVariant("high")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "high"))
elseif command == "med" or command == "medium" then
handle:SetVariant("medium")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "medium"))
elseif command == "low" then
handle:SetVariant("low")
print(PREFIX .. " " .. string.format(L["SOUND_VARIANT_SET"] or "%s", "low"))
else
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "") .. " " .. (L["ERROR_UNKNOWN_COMMAND"] or ""))
end
end

RGX:RegisterEvent("ADDON_LOADED", function(event, addonName)
if addonName ~= ADDON_NAME then return end
handle:SetLocale(SMB3LU.L)
L = SMB3LU.L or {}
handle:Init()
initialized = true
end, "SMB3LU_ADDON_LOADED")

RGX:RegisterEvent("PLAYER_LEVEL_UP", function()
if initialized then
handle:Play()
end
end, "SMB3LU_PLAYER_LEVEL_UP")

RGX:RegisterEvent("PLAYER_LOGIN", function()
if not initialized then
handle:SetLocale(SMB3LU.L)
L = SMB3LU.L or {}
handle:Init()
initialized = true
end
handle:ShowWelcome(PREFIX, TITLE)
end, "SMB3LU_PLAYER_LOGIN")

RGX:RegisterEvent("PLAYER_LOGOUT", function()
handle:Logout()
end, "SMB3LU_PLAYER_LOGOUT")

RGX:RegisterSlashCommand("smb3lu", function(msg)
local ok, err = pcall(HandleSlashCommand, msg)
if not ok then
print(PREFIX .. " " .. (L["ERROR_PREFIX"] or "|cffff0000SMB3LU Error:|r") .. " " .. tostring(err))
end
end, "SMB3LU_SLASH")
