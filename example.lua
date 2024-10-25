local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/alriceeeee/NEVERLOSE-UI-Nightly/main/source.lua"))()

-- Change Theme --
NEVERLOSE:Theme("dark") -- [ dark , nightly , original, light]
------------------

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

-- New section to demonstrate system clock
local ClockSection = MainTab:AddSection('System Clock', "right")

ClockSection:AddLabel("The system clock is now visible in the top-right corner of the UI.")

ClockSection:AddButton("Print Current Time", function()
    local date = os.date("*t")
    local currentTime = string.format("%02d:%02d:%02d", date.hour, date.min, date.sec)
    print("Current time: " .. currentTime)
    Notification:Notify("info", "Current Time", currentTime)
end)
