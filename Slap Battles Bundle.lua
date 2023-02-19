local Players = game:GetService("Players")
local plr = game:GetService("Players").LocalPlayer
local plrGui = plr:WaitForChild("PlayerGui")
local char = plr.Character or plr.CharacterAdded:Wait()

local c
local a,b

local CanUseGloveFunction = true

local OnAutoFarm = false
local AutoFarmSpeedV = 0.6
local AutoFarmWhitelist = {}

local OnSlapAura = false
local SlapAuraSpeed = 0.5
local SlapAuraWhitelist = {}

local orbitgloveson = false
local orbitGlovesSpeedVal = 5

local rockmodektoggle = false

local zzzsleepktoggle = false

local brickktoggle = false
local canspawnbrick = true




local function SlapAura(on)
	if on then
		OnSlapAura = true
		coroutine.wrap(function()
			while OnSlapAura do
				task.wait()
				if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
					for i,player in pairs(Players:GetChildren()) do
						if plr ~= player then
							if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("isInArena") and player.Character.isInArena.Value == true and player.Character:FindFirstChild("HumanoidRootPart") then
								if (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude < 10 then
									if not table.find(SlapAuraWhitelist,player) then
										if OnSlapAura then
											
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
											elseif plr.leaderstats.Glove.Value == "Swapper" then
												game:GetService("ReplicatedStorage"):WaitForChild("HitSwapper"):FireServer(player.Character.Torso)
											elseif plr.leaderstats.Glove.Value == "Bull" then
												game:GetService("ReplicatedStorage"):WaitForChild("BullHit"):FireServer(player.Character.Torso)
											elseif plr.leaderstats.Glove.Value == "Dice" then
												game:GetService("ReplicatedStorage"):WaitForChild("DiceHit"):FireServer(player.Character.Torso)
											elseif plr.leaderstats.Glove.Value == "Ghost" then
												game:GetService("ReplicatedStorage"):WaitForChild("GhostHit"):FireServer(player.Character.Torso)
											elseif plr.leaderstats.Glove.Value == "Thanos" then
												game:GetService("ReplicatedStorage"):WaitForChild("ThanosHit"):FireServer(player.Character.Torso)
											elseif plr.leaderstats.Glove.Value == "Stun" then
												game:GetService("ReplicatedStorage"):WaitForChild("HtStun"):FireServer(player.Character.Torso)
											elseif plr.leaderstats.Glove.Value == "Za Hand" then
												game:GetService("ReplicatedStorage"):WaitForChild("zhramt"):FireServer(player.Character.Torso)
											elseif plr.leaderstats.Glove.Value == "Fort" then
												game:GetService("ReplicatedStorage"):WaitForChild("Fort"):FireServer(player.Character.Torso)
											end
											task.wait(SlapAuraSpeed)
										end
									end
								end
							end
						end
						
					end
				end
			
			end
		end)()
	else
		OnSlapAura = false
	end
end

local function AutoFarm(on)
	if on then
		if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0 then
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
							if player.Character and player.Character.isInArena.Value == true and player.Character.IsInDefaultArena.Value == false and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and not table.find(AutoFarmWhitelist,player) and plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
								local Do = true
								plr.Character:MoveTo(player.Character.HumanoidRootPart.Position + player.Character.HumanoidRootPart.CFrame.LookVector * -2)
								coroutine.wrap(function()
									while Do and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 do
										task.wait()
										plr.Character:MoveTo(player.Character.HumanoidRootPart.Position + player.Character.HumanoidRootPart.CFrame.LookVector * -2)
									end
								end)()
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
									elseif plr.leaderstats.Glove.Value == "Swapper" then
										game:GetService("ReplicatedStorage"):WaitForChild("HitSwapper"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Bull" then
										game:GetService("ReplicatedStorage"):WaitForChild("BullHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Dice" then
										game:GetService("ReplicatedStorage"):WaitForChild("DiceHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Ghost" then
										game:GetService("ReplicatedStorage"):WaitForChild("GhostHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Thanos" then
										game:GetService("ReplicatedStorage"):WaitForChild("ThanosHit"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Stun" then
										game:GetService("ReplicatedStorage"):WaitForChild("HtStun"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Za Hand" then
										game:GetService("ReplicatedStorage"):WaitForChild("zhramt"):FireServer(player.Character.Torso)
									elseif plr.leaderstats.Glove.Value == "Fort" then
										game:GetService("ReplicatedStorage"):WaitForChild("Fort"):FireServer(player.Character.Torso)
									end

									task.wait(0.15)
									Do = false
								else Do = false break 
								
								end

							end
						else break
						end

						if AutoFarmSpeedV ~= 0 then
							task.wait(AutoFarmSpeedV * 0.5)
						else
							 task.wait(AutoFarmSpeedV + 0.3)
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

local GlovesSection = Glovestab:Section("Main")

local GlovesTitle = GlovesSection:Title("Gloves")

local GlovesSearchBar = GlovesSection:SearchBar("Search Gloves...")


local DefaultDropdown = GlovesSearchBar:Dropdown("Default Glove") -- Args(<string> Name)

local GetDefaultG = DefaultDropdown:Button("Get", function()
	GetGlove("Default")
end)


local DiamondDropdown = GlovesSearchBar:Dropdown("Diamond") -- Args(<string> Name)

local GetDiamondG = DiamondDropdown:Button("Get", function()
	GetGlove("Diamond")
end)

local Rockmode = DiamondDropdown:Button("Rockmode", function()
	game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
end)

local RockmodeKeybindD = DiamondDropdown:Dropdown("Keybind")

local RockmodeKToggle = RockmodeKeybindD:Toggle("Toggle", function(val)
	if val then
		rockmodektoggle = true
	else
		rockmodektoggle = false
	end
end)

local RocmodeKeybind = RockmodeKeybindD:Keybind("Key", function()
	if rockmodektoggle then
		game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
	end
end)


local ZzzDropdown = GlovesSearchBar:Dropdown("Zzz") -- Args(<string> Name)

local GetZzzG = ZzzDropdown:Button("Get", function()
	GetGlove("ZZZZZZZ")
end)

local Sleep = ZzzDropdown:Button("Sleep", function()
	game:GetService("ReplicatedStorage"):WaitForChild("ZZZZZZZSleep"):FireServer()
end)

local SleepKeybindD = ZzzDropdown:Dropdown("Keybind")

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


local ExtendedDropdown = GlovesSearchBar:Dropdown("Extended") -- Args(<string> Name)

local GetExtendedG = ExtendedDropdown:Button("Get", function()
	GetGlove("Extended")
end)


local BrickDropdown = GlovesSearchBar:Dropdown("Brick") -- Args(<string> Name)

local GetBrickG = BrickDropdown:Button("Get", function()
	GetGlove("Brick")
end)

local BrickSpawn = BrickDropdown:Button("Spawn Brick", function()
	if canspawnbrick then
		game:GetService("ReplicatedStorage"):WaitForChild("lbrick"):FireServer()
		canspawnbrick = false
		task.wait(5)
		canspawnbrick = true
	end
end)

local BrickSpawnKeybindD = BrickDropdown:Dropdown("Keybind")

local BrickKToggle = BrickSpawnKeybindD:Toggle("Toggle", function(val)
	if val then
		brickktoggle = true
	else
		brickktoggle = false
	end
end)

local BrickKeybind = BrickSpawnKeybindD:Keybind("Key", function()
	if canspawnbrick and brickktoggle then
		game:GetService("ReplicatedStorage"):WaitForChild("lbrick"):FireServer()
		canspawnbrick = false
		task.wait(5)
		canspawnbrick = true
	end
end)


local SnowDropdown = GlovesSearchBar:Dropdown("Snow") -- Args(<string> Name)

local GetSnowG = SnowDropdown:Button("Get", function()
	GetGlove("Snow")
end)


local PullDropdown = GlovesSearchBar:Dropdown("Pull") -- Args(<string> Name)

local GetPullG = PullDropdown:Button("Get", function()
	GetGlove("Pull")
end)



local OrbitDropdown = GlovesSearchBar:Dropdown("Orbit") -- Args(<string> Name)

local OrbitGetButton = OrbitDropdown:Button("Get", function()
	GetGlove("Orbit")
end)

local OrbitGlovesDropdown = OrbitDropdown:Dropdown("Gloves Speed")


local GlovesToggle = OrbitGlovesDropdown:Toggle("Enable", function(bool)
	if bool then
		orbitgloveson = true
		OrbitGlovesSpeed(orbitGlovesSpeedVal,true)
	else
		orbitgloveson = false
		
		OrbitGlovesSpeed(orbitGlovesSpeedVal,false)
	end
end)

OrbitGlovesDropdown:Slider("Speed", function(val)
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

		

		AutoFarm(val)
	else
		OnAutoFarm = val

		AutoFarm(val)
	end
end)



local AutoFarmSpeed = AutoFarmDropdown:Slider("CD", function(val)
	AutoFarmSpeedV = val
end, 2,0)

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

Players.PlayerAdded:Connect(function(v1)
	if v1 ~= plr then
		local r

		local PlayerToggle2 = AutoFarmFilter:Toggle(v1.Name, function(val)
			if val then
				table.insert(AutoFarmWhitelist,v1)
			else
				if table.find(AutoFarmWhitelist,v1) then
					table.remove(AutoFarmWhitelist,table.find(AutoFarmWhitelist,v1))
				end
			end
		end)

		r = Players.PlayerRemoving:Connect(function(player)
			if player == v1 then
				PlayerToggle2:Remove()
				if table.find(AutoFarmWhitelist,v1) then
					table.remove(AutoFarmWhitelist,table.find(AutoFarmWhitelist,v1))
					r:Disconnect()
				end
			end
		end)

	end
end)

local AutoFarmKeybind = AutoFarmDropdown:Keybind("Toggle Keybind", function()
	if not OnAutoFarm then
		AutoFarmToggle:Set(true, function(val)
			OnAutoFarm= true
			
			AutoFarm(true)
			
		end)
	else
		AutoFarmToggle:Set(false, function(val)
			OnAutoFarm = false
			
			AutoFarm(false)
		end)
	end
end, "Z")


local SlapAuraTitle = MainAbSection:Title("Slap Aura")

local SlapAuraDropdown = MainAbSection:Dropdown("Slap Aura")

local SlapAuraToggle = SlapAuraDropdown:Toggle("Toggle",function(val)
	if val then
		OnSlapAura = val

		SlapAura(val)
	else
		OnSlapAura = val

		SlapAura(val)
	end
end)


local SlapAuraSpeedS = SlapAuraDropdown:Slider("CD (0 = 0.2,1 = 0.5, 2 = 1; etc.)", function(val)
	local num = val * 0.5

	if num == 0 then
		num = 0.2
	end
	if num > 0.1 and num < 3 then
	end
end, 2,0)

local SlapAuraFilter = SlapAuraDropdown:SearchBar("Whitelist")

for i,v in pairs(Players:GetChildren()) do
	if v ~= plr then
		local PlayerToggle = SlapAuraFilter:Toggle(v.Name, function(val)
			if val then
				table.insert(SlapAuraWhitelist,v)
			else
				if table.find(SlapAuraWhitelist,v) then
					table.remove(SlapAuraWhitelist,table.find(SlapAuraWhitelist,v))
				end
			end
		end)

		

		Players.PlayerRemoving:Connect(function(player)
			if player == v then
				PlayerToggle:Remove()
				if table.find(SlapAuraWhitelist,v) then
					table.remove(SlapAuraWhitelist,table.find(SlapAuraWhitelist,v))
				end
			end
		end)
	end
end

Players.PlayerAdded:Connect(function(v1)
	if v1 ~= plr then
		local r

		local PlayerToggle2 = SlapAuraFilter:Toggle(v1.Name, function(val)
			if val then
				table.insert(SlapAuraWhitelist,v1)
			else
				if table.find(SlapAuraWhitelist,v1) then
					table.remove(SlapAuraWhitelist,table.find(SlapAuraWhitelist,v1))
				end
			end
		end)

		r = Players.PlayerRemoving:Connect(function(player)
			if player == v1 then
				PlayerToggle2:Remove()
				if table.find(SlapAuraWhitelist,v1) then
					table.remove(SlapAuraWhitelist,table.find(SlapAuraWhitelist,v1))
					r:Disconnect()
				end
			end
		end)

	end
end)

local SlapAuraKeybind = SlapAuraDropdown:Keybind("Toggle Keybind", function()
	if not OnSlapAura then
		SlapAuraToggle:Set(true, function(val)
			OnSlapAura = true
			
			SlapAura(true)
			
		end)
	else
		SlapAuraToggle:Set(false, function(val)
			OnSlapAura = false
			
			SlapAura(false)
		end)
	end
end, "X")
