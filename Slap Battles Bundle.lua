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

local canMagnetS = true
local magnetktoggle = false

local canFlashS = true
local flashktoggle = false
local flashLenght = 25

local springktoggle = false

local canUseSLOC = true
local toggleksloc = false
local SLOCSP = false

local canUseGInvis = true
local usinginvis = false
local ghostktoggle = false


local freezePlr = false

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
											elseif plr.leaderstats.Glove.Value == "Magnet" then
												game:GetService("ReplicatedStorage"):WaitForChild("MagnetHIT"):FireServer(player.Character.Torso)
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
									elseif plr.leaderstats.Glove.Value == "Magnet" then
										game:GetService("ReplicatedStorage"):WaitForChild("MagnetHIT"):FireServer(player.Character.Torso)
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

local function AnchorHRP(val)
    if not plr.Character and not plr.Character:FindFirstChild("HumanoidRootPart") then return end
    if val then
        plr.Character.HumanoidRootPart.Anchored = true
    else
        plr.Character.HumanoidRootPart.Anchored = false
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

local AbilitiesTab = window:Tab("Abilities") -- Args(<string> Name, <string?> TabImage)

local MainAbSection = AbilitiesTab:Section("Main")

local GlovesSection = Glovestab:Section("Main")

GlovesSection:Title("Slaps Gloves")

local SlapsGlovesSearchBar = GlovesSection:SearchBar("Search Slaps Gloves...")

GlovesSection:Title("Badge Gloves")

local BadgeGlovesSearchBar = GlovesSection:SearchBar("Search Badge Gloves...")

GlovesSection:Title("Robux Gloves")

local RobuxGlovesSearchBar = GlovesSection:SearchBar("Search Robux Gloves...")


local DefaultDropdown = SlapsGlovesSearchBar:Dropdown("Default Glove") -- Args(<string> Name)

local GetDefaultG = DefaultDropdown:Button("Get", function()
	GetGlove("Default")
end)


local DiamondDropdown = SlapsGlovesSearchBar:Dropdown("Diamond") -- Args(<string> Name)

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


local ZzzDropdown = SlapsGlovesSearchBar:Dropdown("Zzz") -- Args(<string> Name)

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


local ExtendedDropdown = SlapsGlovesSearchBar:Dropdown("Extended") -- Args(<string> Name)

local GetExtendedG = ExtendedDropdown:Button("Get", function()
	GetGlove("Extended")
end)


local BrickDropdown = SlapsGlovesSearchBar:Dropdown("Brick") -- Args(<string> Name)

local GetBrickG = BrickDropdown:Button("Get", function()
	GetGlove("Brick")
end)

local BrickSpawn = BrickDropdown:Button("Spawn Brick", function()
	if canspawnbrick then
		game:GetService("ReplicatedStorage"):WaitForChild("lbrick"):FireServer()
		canspawnbrick = false
		task.wait(1.3)
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
		task.wait(1.3)
		canspawnbrick = true
	end
end)


local SnowDropdown = SlapsGlovesSearchBar:Dropdown("Snow") -- Args(<string> Name)

local GetSnowG = SnowDropdown:Button("Get", function()
	GetGlove("Snow")
end)


local PullDropdown = SlapsGlovesSearchBar:Dropdown("Pull") -- Args(<string> Name)

local GetPullG = PullDropdown:Button("Get", function()
	GetGlove("Pull")
end)


local FlashDropdown = SlapsGlovesSearchBar:Dropdown("Flash") -- Args(<string> Name)

local GetFlashG = FlashDropdown:Button("Get", function()
	GetGlove("Flash")
end)

local FlashS = FlashDropdown:Button("Flash Teleport", function()
	if canFlashS and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		game:GetService("ReplicatedStorage"):WaitForChild("FlashTeleport"):FireServer()
		canFlashS = false
		task.wait(0.5)
		plr.Character:MoveTo(plr.Character.HumanoidRootPart.Position + plr.Character.HumanoidRootPart.CFrame.LookVector * flashLenght)
		task.wait(1.5)
		canFlashS = true
	end
end)

local FlashLenght = FlashDropdown:Slider("Lenght in studs", function(val)
	flashLenght = val
end, 70,5)

local FlashSKeybindD = FlashDropdown:Dropdown("Keybind")

local FlashSKToggle = FlashSKeybindD:Toggle("Toggle", function(val)
	if val then
		flashktoggle = true
	else
		flashktoggle = false
	end
end)

local FlashKeybind = FlashSKeybindD:Keybind("Key", function()
	if canFlashS and flashktoggle and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		game:GetService("ReplicatedStorage"):WaitForChild("FlashTeleport"):FireServer()
		canFlashS = false
		task.wait(0.5)
		plr.Character:MoveTo(plr.Character.HumanoidRootPart.Position + plr.Character.HumanoidRootPart.CFrame.LookVector * flashLenght)
		task.wait(1.5)
		canFlashS = true
	end
end)


local SpringDropdown = SlapsGlovesSearchBar:Dropdown("Spring") -- Args(<string> Name)

local GetSpringG = SpringDropdown:Button("Get", function()
	GetGlove("Spring")
end)

local SpringSound = SpringDropdown:Button("Spring Sound", function()
	if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		game:GetService("ReplicatedStorage"):WaitForChild("SpringJump"):FireServer()
	end
end)

local SpringJSlider = SpringDropdown:Slider("Jump Power", function(val)
	if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 and plr.leaderstats.Glove.Value == "Spring" then
		while plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 and plr.leaderstats.Glove.Value == "Spring" do
			plr.Character.Humanoid.JumpPower = val
			task.wait(0.1)
		end
	end
end, 120, 50)

local SpringSKeybindD = SpringDropdown:Dropdown("Keybind")

local SpringSKToggle = SpringSKeybindD:Toggle("Toggle", function(val)
	if val then
		springktoggle = true
	else
		springktoggle = false
	end
end)

local SpringKeybind = SpringSKeybindD:Keybind("Key", function()
	if springktoggle and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		game:GetService("ReplicatedStorage"):WaitForChild("SpringJump"):FireServer()
	end
end)


local SwapperDropdown = SlapsGlovesSearchBar:Dropdown("Swapper") -- Args(<string> Name)

local GetSwapperG = SwapperDropdown:Button("Get", function()
	GetGlove("Swapper")
end)

local SLOC = SwapperDropdown:Button("Swap Positions", function()
	if canUseSLOC and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		local pos = plr.Character.HumanoidRootPart.Position

		game:GetService("ReplicatedStorage"):WaitForChild("SLOC"):FireServer()

		canUseSLOC = false

		if SLOCSP then
			task.wait(0.2)
			plr.Character:MoveTo(pos)
		end


		task.wait(6.5)

		canUseSLOC = true
	end
end)

SwapperDropdown:Toggle("Save Position", function(val)
	SLOCSP = val
end)

local SwapperSKeybindD = SwapperDropdown:Dropdown("Keybind")

local SwapperSKToggle = SwapperSKeybindD:Toggle("Toggle", function(val)
	if val then
		swapperktoggle = true
	else
		swapperktoggle = false
	end
end)

local SwapperKeybind = SwapperSKeybindD:Keybind("Key", function()
	if swapperktoggle and canUseSLOC and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		local pos = plr.Character.HumanoidRootPart.Position

		game:GetService("ReplicatedStorage"):WaitForChild("SLOC"):FireServer()

		canUseSLOC = false

		if SLOCSP then
			task.wait(0.2)
			plr.Character:MoveTo(pos)
		end

		

		task.wait(6.5)

		canUseSLOC = true
	end
end)


local BullDropdown = SlapsGlovesSearchBar:Dropdown("Bull") -- Args(<string> Name)

local GetBullG = BullDropdown:Button("Get", function()
	GetGlove("Bull")
end)


local DiceDropdown = SlapsGlovesSearchBar:Dropdown("Dice") -- Args(<string> Name)

local GetDiceG = DiceDropdown:Button("Get", function()
	GetGlove("Dice")
end)


local GhostDropdown = SlapsGlovesSearchBar:Dropdown("Ghost") -- Args(<string> Name)

local GetGhostG = GhostDropdown:Button("Get", function()
	GetGlove("Ghost")
end)

local GhostInvis = GhostDropdown:Button("Invisibility", function()
	if canUseGInvis and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		if not usinginvis then
			local kk

			game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilityactivated"):FireServer()

			canUseGInvis = false
			usinginvis = true

			kk = plr.Character.Humanoid.Died:Connect(function()
				usinginvis = false
				kk:Disconnect()
			end)

			task.wait(1)

			canUseGInvis = true
		else
			local kk

			game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilitydeactivated"):FireServer()

			canUseGInvis = false
			usinginvis = false


			task.wait(3)

			canUseGInvis = true
		end
	end
end)

local GhostSKeybindD = GhostDropdown:Dropdown("Keybind")

local GhostSKToggle = GhostSKeybindD:Toggle("Toggle", function(val)
	if val then
		ghostktoggle = true
	else
		ghostktoggle = false
	end
end)

local GhostKeybind = GhostSKeybindD:Keybind("Key", function()
	if ghostktoggle and canUseGInvis and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		if not usinginvis then
			local kk

			game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilityactivated"):FireServer()

			canUseGInvis = false
			usinginvis = true

			kk = plr.Character.Humanoid.Died:Connect(function()
				usinginvis = false
				kk:Disconnect()
			end)

			task.wait(1)

			canUseGInvis = true
		else
			local kk

			game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilitydeactivated"):FireServer()

			canUseGInvis = false
			usinginvis = false


			task.wait(3)

			canUseGInvis = true
		end
	end
end)


local ThanosDropdown = SlapsGlovesSearchBar:Dropdown("Thanos") -- Args(<string> Name)

local GetThanosG = GhostDropdown:Button("Get", function()
	GetGlove("Thanos")
end)

local ThanosSetPoint = ThanosDropdown:Button("Set Point", function()
	if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		
	end
end)

local GhostSKeybindD = GhostDropdown:Dropdown("Keybind")

local GhostSKToggle = GhostSKeybindD:Toggle("Toggle", function(val)
	if val then
		ghostktoggle = true
	else
		ghostktoggle = false
	end
end)

local GhostKeybind = GhostSKeybindD:Keybind("Key", function()
	if ghostktoggle and canUseGInvis and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		if not usinginvis then
			local kk

			game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilityactivated"):FireServer()

			canUseGInvis = false
			usinginvis = true

			kk = plr.Character.Humanoid.Died:Connect(function()
				usinginvis = false
				kk:Disconnect()
			end)

			task.wait(1)

			canUseGInvis = true
		else
			local kk

			game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilitydeactivated"):FireServer()

			canUseGInvis = false
			usinginvis = false


			task.wait(3)

			canUseGInvis = true
		end
	end
end)



local MagnetDropdown = SlapsGlovesSearchBar:Dropdown("Magnet") -- Args(<string> Name)

local GetMagnetG = MagnetDropdown:Button("Get", function()
	GetGlove("Magnet")
end)

local MagnetS = MagnetDropdown:Button("Magnet", function()
	if canMagnetS and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		

		local newAlignPosition = Instance.new("AlignPosition")
		newAlignPosition.Parent = plr.Character.HumanoidRootPart
		newAlignPosition.Mode = "OneAttachment"
		
		local att0 = Instance.new("Attachment")
		att0.Parent = plr.Character.HumanoidRootPart
		att0.WorldPosition = plr.Character.HumanoidRootPart.Position

		local closest = nil
		

		local close = {}

		for i,v in pairs(game.Players:GetChildren()) do
			if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("isInArena") and v.Character.isInArena.Value == true then
				if v ~= plr then
					table.insert(close, (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude)
				end
			end
		end

		if #close > 1 then
			local cls = math.min(table.unpack(close))

			for i,v in pairs(game.Players:GetChildren()) do
				if v ~= plr then
					if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("isInArena") and v.Character.isInArena.Value == true then
						if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude == cls then
							closest = v
						end
					end
				end
			end
		elseif #close > 0 then
			closest = close[1]
		end
		
		if closest then

			newAlignPosition.Attachment0 = att0
			newAlignPosition.Position = closest.Character.HumanoidRootPart.Position
			newAlignPosition.MaxForce = 122312332113

			plr.Character.Humanoid.Jump = true

			canMagnetS = false

			task.wait(1)

			if att0 and newAlignPosition then
				att0:Destroy()
				newAlignPosition:Destroy()
			end

			task.wait(1)
			canMagnetS = true
		end
	end
end)

local MagnetSKeybindD = MagnetDropdown:Dropdown("Keybind")

local MagnetSKToggle = MagnetSKeybindD:Toggle("Toggle", function(val)
	if val then
		magnetktoggle = true
	else
		magnetktoggle = false
	end
end)

local MagnetKeybind = MagnetSKeybindD:Keybind("Key", function()
	if canMagnetS and magnetktoggle and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
		

		local newAlignPosition = Instance.new("AlignPosition")
		newAlignPosition.Parent = plr.Character.HumanoidRootPart
		newAlignPosition.Mode = "OneAttachment"
		
		local att0 = Instance.new("Attachment")
		att0.Parent = plr.Character.HumanoidRootPart
		att0.WorldPosition = plr.Character.HumanoidRootPart.Position

		local closest = nil
		

		local close = {}

		for i,v in pairs(game.Players:GetChildren()) do
			if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("isInArena") and v.Character.isInArena.Value == true then
				if v ~= plr then
					table.insert(close, (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude)
				end
			end
		end

		if #close > 1 then
			local cls = math.min(table.unpack(close))

			for i,v in pairs(game.Players:GetChildren()) do
				if v ~= plr then
					if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("isInArena") and v.Character.isInArena.Value == true then
						if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude == cls then
							closest = v
						end
					end
				end
			end
		elseif #close > 0 then
			closest = close[1]
		end
		
		if closest then

			local magnet = true

			newAlignPosition.Attachment0 = att0
		
			newAlignPosition.MaxForce = 122312332113

			plr.Character.Humanoid.Jump = true

			coroutine.wrap(function()
				while magnet do
					newAlignPosition.Position = closest.Character.HumanoidRootPart.Position
					task.wait()
				end
			end)()

			canMagnetS = false

			task.wait(1)

			magnet = false

			if att0 and newAlignPosition then
				att0:Destroy()
				newAlignPosition:Destroy()
			end

			task.wait(1)
			canMagnetS = true
		end
	end
end)

local OrbitDropdown = BadgeGlovesSearchBar:Dropdown("Orbit") -- Args(<string> Name)

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


local SlapAuraSpeedS = SlapAuraDropdown:Slider("CD (0 = 0.5,1 = 1, 2 = 1.5; etc.)", function(val)
	local num = val * 0.75

	if num == 0 then
		num = 0.5
	end
	if num > 0.1 and num < 3 then
	end
end, 2,0)

local SlapAuraFilter = SlapAuraDropdown:SearchBar("Whitelist")

local FreezePlrTitle = MainAbSection:Title("HRP Anchor")
local FrPlrDropdown = MainAbSection:Dropdown("HRP Anchor")
local FrPlrToggle = FrPlrDropdown:Toggle("Toggle",function(val)
	if val then
		freezePlr = true
	else
		freezePlr = false
	end
    AnchorHRP(val)
end)

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


local FreezeHRPKeybind = FrPlrDropdown:Keybind("Toggle Keybind", function()
	if not freezePlr then
		FrPlrToggle:Set(true, function(val)
			freezePlr = true
			
			AnchorHRP(true)
			
		end)
	else
		FrPlrToggle:Set(false, function(val)
			freezePlr = false
			
			AnchorHRP(false)
			
		end)
	end
end, "X")
