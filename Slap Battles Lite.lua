-- MADE BY FastTpService / PivotMakesCoolGames (2 accs)

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

local c
local a,b

local orbitgloveson = false
local orbitGlovesSpeedVal = 5

local zzzsleepktoggle = false



local function GetGlove(glove)
	if workspace.Lobby:FindFirstChild(glove) then
		if plr.Character and plr.Character.isInArena.Value == false then
			fireclickdetector(workspace.Lobby:FindFirstChild(glove).ClickDetector)
		end
	end
end

local function OrbitGlovesSpeed(val,on)
	if on then
		if plr.Character and plr.Character.HumanoidRootPart:FindFirstChild("OrbitGloves") then
			plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.AngularVelocity = -val
			plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.MotorMaxTorque = 31123132123123
			c = plr.CharacterAdded:Connect(function(char)
				if plr.Backpack:FindFirstChild("Orbit") or plr.Character:FindFirstChild("Orbit") then
					plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.MotorMaxTorque = 31123132123123
					plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.AngularVelocity = -val
				else
					a = plr.Backpack.ChildAdded:Connect(function(child)
						if child.Name == "Orbit" then
							OrbitGlovesSpeed(orbitGlovesSpeedVal,on)
							a:Disconnect()
							b:Disconnect()
						end
					end)
					b = plr.Character.ChildAdded:Connect(function(child)
						if child.Name == "Orbit" then
							OrbitGlovesSpeed(orbitGlovesSpeedVal,on)
							b:Disconnect()
							a:Disconnect()
						end
					end)
				end
			end)
		else
			if not plr.Character then
				c = plr.CharacterAdded:Connect(function(char)
					if plr.Backpack:FindFirstChild("Orbit") or plr.Character:FindFirstChild("Orbit") then
						plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.MotorMaxTorque = 31123132123123
						plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.AngularVelocity = -val
						
					else
						a = plr.Backpack.ChildAdded:Connect(function(child)
							if child.Name == "Orbit" then
								OrbitGlovesSpeed(orbitGlovesSpeedVal,on)
								a:Disconnect()
								b:Disconnect()
							end
						end)
						b = plr.Character.ChildAdded:Connect(function(child)
							if child.Name == "Orbit" then
								OrbitGlovesSpeed(orbitGlovesSpeedVal,on)
								b:Disconnect()
								a:Disconnect()
							end
						end)
					end
				end)
			else
				if plr.Backpack:FindFirstChild("Orbit") or plr.Character:FindFirstChild("Orbit") then
					plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.MotorMaxTorque = 31123132123123
					plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.AngularVelocity = -val
				else
					a = plr.Backpack.ChildAdded:Connect(function(child)
						if child.Name == "Orbit" then
							OrbitGlovesSpeed(orbitGlovesSpeedVal,on)
							a:Disconnect()
							b:Disconnect()
						end
					end)
					b = plr.Character.ChildAdded:Connect(function(child)
						if child.Name == "Orbit" then
							OrbitGlovesSpeed(orbitGlovesSpeedVal,on)
							b:Disconnect()
							a:Disconnect()
						end
					end)
				end
			end
		end
	else
		plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.AngularVelocity = -5
		plr.Character.HumanoidRootPart.OrbitGloves.HingePart.HingeConstraint.MotorMaxTorque = 10
	end
end


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/cerberus.lua"))()

local window = Library.new("Slap Battles Lite (Made by FastTpService)") -- Args(<string> Name, <boolean?> ConstrainToScreen)

window:LockScreenBoundaries(false) -- Args(<boolean> ConstrainToScreen)

local Glovestab = window:Tab("Gloves") -- Args(<string> Name, <string?> TabImage)


local sectionDefault = Glovestab:Section("Default Glove") -- Args(<string> Name)

local DefaultTitle = sectionDefault:Title("Get Default Glove") -- Args(<string> Name) -- Args(<String> NewText)

local GetDefaultG = sectionDefault:Button("Get", function()
	GetGlove("Default")
end)


local sectionZzz = Glovestab:Section("Zzz") -- Args(<string> Name)

local ZzzGetTitle = sectionZzz:Title("Get Zzz Glove") -- Args(<string> Name) -- Args(<String> NewText)

local GetZzzG = sectionZzz:Button("Get", function()
	GetGlove("ZZZZZZZ")
end)

local ZzzTitle = sectionZzz:Title("Sleep Farm") -- Args(<string> Name) -- Args(<String> NewText)

local Sleep = sectionZzz:Button("Sleep", function()
	game:GetService("ReplicatedStorage"):WaitForChild("ZZZZZZZSleep"):FireServer()
end)

local SleepKeybindD = sectionZzz:Dropdown("Keybind")

local SleepKToggle = SleepKeybindD:Toggle("Toggle", function(val)
	if val then
		zzzsleepktoggle = true
	else
		zzzsleepktoggle = false
	end
end)

local SleepKeybind = SleepKeybindD:Keybind("Key", function()
	game:GetService("ReplicatedStorage"):WaitForChild("ZZZZZZZSleep"):FireServer()
end)


local sectionOrbit = Glovestab:Section("Orbit") -- Args(<string> Name)

local OrbitGetTitle = sectionOrbit:Title("Get Orbit") -- Args(<string> Name) -- Args(<String> NewText)

local OrbitGetButton = sectionOrbit:Button("Get", function()
	GetGlove("Orbit")
end)

local OrbitTitle = sectionOrbit:Title("Gloves") -- Args(<string> Name) -- Args(<String> NewText)

local GlovesDropdown = sectionOrbit:Dropdown("Gloves Speed")


local GlovesToggle = GlovesDropdown:Toggle("Enable", function(bool)
	if bool then
		orbitgloveson = true
		OrbitGlovesSpeed(orbitGlovesSpeedVal,true)
	else
		orbitgloveson = false
		
		OrbitGlovesSpeed(orbitGlovesSpeedVal,false)
	end
end)

GlovesDropdown:Slider("Speed", function(val)
	orbitGlovesSpeedVal = val
	OrbitGlovesSpeed(val,orbitgloveson)
end) -- Args(<String> Name, <Function> Callback, <Number?> MaximumValue, <Number?> MinimumValue)
