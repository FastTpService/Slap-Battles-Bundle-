local Players = game:GetService("Players")
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

local c
local a,b

local OnAutoFarm = false
local AutoFarmSpeedV = 0.6
local AutoFarmWhitelist = {}

local OnSlapAura = false
local SlapAuraSpeed = 0.5

local orbitgloveson = false
local orbitGlovesSpeedVal = 5

local zzzsleepktoggle = false





local function AutoFarm(on)
	if on then
		if plr.Character and plr.Character.isInArena.Value == true then
			local PlrsTable = {}

			OnAutoFarm = true
			local CurrOnAutoFarm = true

			for i,v in pairs(Players:GetChildren()) do
				if v.Character and v.Character:FindFirstChild("isInArena") and v.Character.isInArena.Value == true and v.Character.IsInDefaultArena.Value == false and v.Character:FindFirstChild("Humanoid") then
					if v ~= plr then
						if v.Character.Humanoid.Health > 0 then
							if not table.find(AutoFarmWhitelist,v) then
								table.insert(PlrsTable, v)
							end
						end
					end
				end
			end

			
			coroutine.wrap(function()
				repeat task.wait() until not OnAutoFarm
				CurrOnAutoFarm = false
			end)()

			coroutine.wrap(function()
				while CurrOnAutoFarm do
					for i,v in pairs(PlrsTable) do
						if not v.Character or v.Character.isInArena.Value == false and v.Character.IsInDefaultArena.Value == true or table.find(AutoFarmWhitelist,LookVector) then
							if table.find(PlrsTable,v) then
								table.remove(PlrsTable,table.find(PlrsTable,v))
							end
						end
					end

					for i,v in pairs(Players:GetChildren()) do
						if v ~= plr then
							if not table.find(PlrsTable,v) then
								if v.Character and v.Character:FindFirstChild("isInArena") and v.Character.isInArena.Value == true and v.Character.IsInDefaultArena.Value == false and v.Character:FindFirstChild("Humanoid") then
									if v.Character.Humanoid.Health > 0 then
										if not table.find(AutoFarmWhitelist,v) then
											table.insert(PlrsTable, v)
										end
									end
								end
							end
						end
					end

					task.wait(0.1)
				end
			end)()

			
			coroutine.wrap(function()
				while CurrOnAutoFarm do
					for i,player in pairs(PlrsTable) do
						if CurrOnAutoFarm then
							if player.Character and player.Character.isInArena.Value == true and player.Character.IsInDefaultArena.Value == false and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and not table.find(AutoFarmWhitelist,player) then
								plr.Character:MoveTo(player.Character.HumanoidRootPart.Position + player.Character.HumanoidRootPart.CFrame.LookVector * -2)
								task.wait(0.1)

								if CurrOnAutoFarm then

									if plr.leaderstats.Glove.Value == "Default" or plr.leaderstats.Glove.Value == "Extended" or plr.leaderstats.Glove.Value == ""  then
										game:GetService("ReplicatedStorage"):WaitForChild("b"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Diamond" then
										game:GetService("ReplicatedStorage"):WaitForChild("DiamondHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "ZZZZZZZ" then
										game:GetService("ReplicatedStorage"):WaitForChild("ZZZZZZZHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Brick" then
										game:GetService("ReplicatedStorage"):WaitForChild("BrickHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Snow" then
										game:GetService("ReplicatedStorage"):WaitForChild("SnowHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Pull" then
										game:GetService("ReplicatedStorage"):WaitForChild("PullHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Flash" then
										game:GetService("ReplicatedStorage"):WaitForChild("FlashHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Spring" then
										game:GetService("ReplicatedStorage"):WaitForChild("springhit"):FireServer(player.Character.Torso)
									end

									task.wait(0.1)
								else break 
								
								end

							end
						else break
						end

						if AutoFarmSpeedV ~= 0 then
							task.wait(AutoFarmSpeedV * 0.5)
						else
							 task.wait(AutoFarmSpeedV + 0.2)
						end
					end
					
					if AutoFarmSpeedV ~= 0 then
						task.wait(AutoFarmSpeedV * 0.5)
					else task.wait(AutoFarmSpeedV + 0.2)
					end
				end
			end)()
		end
	else
		OnAutoFarm = false
		
		
	end
end


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



local AbilitiesTab = window:Tab("Abilities") -- Args(<string> Name, <string?> TabImage)

local MainAbSection = AbilitiesTab:Section("Main")


local AutoFarmTitle = MainAbSection:Title("Slaps Auto Farm")

local AutoFarmDropdown = MainAbSection:Dropdown("Slaps Auto Farm")

local AutoFarmToggle = AutoFarmDropdown:Toggle("Toggle",function(val)
	if val then
		OnAutoFarm = val

		print(1)

		AutoFarm(val)
	else
		OnAutoFarm = val

		AutoFarm(val)
	end
end)

local AutoFarmFilter = AutoFarmDropdown:SearchBar("Whitelist")

for i,v in pairs(Players:GetChildren()) do
	if v ~= plr then
		local PlayerToggle = AutoFarmFilter:Toggle(v.Name, function(val)
			if val then
				table.insert(AutoFarmWhitelist,v)
			else
				if table.find(AutoFarmWhitelist,v) then
					table.remove(AutoFarmWhitelist,table.find(AutoFarmWhitelist,v))
				end
			end
		end)

		Players.PlayerAdded:Connect(function(v1)
			if v1 ~= plr then
				local r

				local PlayerToggle2 = AutoFarmFilter:Toggle(v.Name, function(val)
					if val then
						table.insert(AutoFarmWhitelist,v1)
					else
						if table.find(AutoFarmWhitelist,v1) then
							table.remove(AutoFarmWhitelist,table.find(AutoFarmWhitelist,v1))
						end
					end
				end)

				r = Players.PlayerRemoving:Connect(function(player)
					if player2 == v1 then
						PlayerToggle2:Remove()
						if table.find(AutoFarmWhitelist,v1) then
							table.remove(AutoFarmWhitelist,table.find(AutoFarmWhitelist,v1))
							r:Disconnect()
						end
					end
				end)
			end
		end)

		Players.PlayerRemoving:Connect(function(player)
			if player == v then
				PlayerToggle:Remove()
				if table.find(AutoFarmWhitelist,v) then
					table.remove(AutoFarmWhitelist,table.find(AutoFarmWhitelist,v))
				end
			end
		end)
	end
end

local AutoFarmSpeed = AutoFarmDropdown:Slider("CD", function(val)
	AutoFarmSpeedV = val
end, 2,1)


local SlapAuraTitle = MainAbSection:Title("Slap Aura")

local SlapAuraDropdown = MainAbSection:Dropdown("Slap Aura")

local SlapAuraToggle = SlapAuraDropdown:Toggle("Toggle",function(val)
	if val then
		OnSlapAura = val

		
	else
		OnSlapAura = val

		
	end
end)


local SlapAuraSpeedS = SlapAuraDropdown:Slider("CD (0 = 0.2,1 = 0.5, 2 = 1; etc.)", function(val)
	local num = val
	if num > 0.5 and num < 3 then
	end
end, 2,0)