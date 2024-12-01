-- Create config table to store the NEVERLOSE instance
local Config = {
    NEVERLOSE = nil
}

local function LoadLibrary()
    local source = game:HttpGet("https://raw.githubusercontent.com/alriceeeee/NEVERLOSE-UI-Nightly/main/source.lua")
    if not source then
        warn("Failed to fetch library source")
        return nil
    end
    
    local fn, loadError = loadstring(source)
    if not fn then
        warn("Failed to compile library:", loadError)
        return nil
    end
    
    return fn()
end

-- Initialize NEVERLOSE only once
if not Config.NEVERLOSE then
    local success, lib = pcall(LoadLibrary)
    if not success or not lib then
        warn("Failed to load NEVERLOSE UI Library:", lib)
        return
    end
    Config.NEVERLOSE = lib
end

local NEVERLOSE = Config.NEVERLOSE

-- Change Theme --
NEVERLOSE:Theme("light") -- [ dark , nightly , original, light]
------------------

-- Check if window already exists and destroy it
if NEVERLOSE._ActiveWindow then
    NEVERLOSE._ActiveWindow:Destroy()
end

local Window = NEVERLOSE:AddWindow("NEVERLOSE","TEXT HERE")
local Notification = NEVERLOSE:Notification()

Notification.MaxNotifications = 6

Window:AddTabLabel('Home')

local ExampleTab = Window:AddTab('Example Tab','earth') -- [ads , list , folder , earth , locked , home , mouse , user]
local MainTab = Window:AddTab('Test','ads')

local Example = ExampleTab:AddSection('Example',"left")

Example:AddLabel("Label")

Example:AddButton("Test Notification",function()
	print('button')
	Notification:Notify("info","Notification","Test Notification")
	Notification:Notify("warning","Notification","Don't Spam",4)
end)

Example:AddToggle('Toggle',false,function(val)
	print("Toggle",val)
end)

Example:AddColorPicker('Color Picker', Color3.fromRGB(255, 0, 0), function(color)
    print('color picker', color)
    -- You can use the color value here
    -- Example: updating UI element colors
    -- SomeElement.BackgroundColor3 = color
end)

Example:AddKeybind('Keybind',Enum.KeyCode.X,function(val)
	print('keybind',val)
end)

Example:AddSlider('Slider',1,100,50,function(val)
	print('slider',val)
end)

Example:AddDropdown('Dropdown',{1,2,3},2,function(val)
	print("dropdown",val)
end)

-- Section Function --

local Test = ExampleTab:AddSection('Test',"right")

Test:AddToggle('Example',true,function(val)
	if val then
		Example:Show()
	else
		Example:Hide()
	end
end)

--------------------

local SectionTest = MainTab:AddSection('Test',"left")

SectionTest:AddButton("Kick",function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local function rejoinGame()
    local player = Players.LocalPlayer
    local placeId = game.PlaceId
    local jobId = game.JobId

    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
end

-- Call the function to rejoin immediately
rejoinGame()

print("Attempting to rejoin the current game...")
end)

-- The system clock is now visible in the bottom-right corner of the UI
