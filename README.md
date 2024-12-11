# NEVERLOSE
## NEVERLOSE UI Library
![Screenshot 2023-10-10 103415](https://github.com/3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/assets/117000269/1f8be350-58e7-409d-8389-d6b1e7da2afe)
![Screenshot 2023-10-10 103444](https://github.com/3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/assets/117000269/3c358aa1-fed3-48dd-abcb-c01030dd9f41)
![Screenshot 2023-10-10 103513](https://github.com/3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/assets/117000269/8d81318b-7cf8-4ad2-8b1b-5517cfdf94ea)

# Example Code
```lua
local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/main/source.lua"))()

-- Change Theme --
NEVERLOSE:Theme("dark") -- [ dark , nightly , original ]
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
	--game.Players.LocalPlayer:Kick()
end)
```

# Key System

```lua
local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/main/source.lua"))()

local function Start(Key)
	local Window = NEVERLOSE:AddWindow("NEVERLOSE","TEXT HERE")
end

local KeySystem = NEVERLOSE:KeySystem("Key System","https://discord.gg/bedol-hub",function(key)
	if key=='1234' then
		return true
	end
	return false
end)

KeySystem:Callback(Start)
```
