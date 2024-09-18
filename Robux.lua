local s,e = pcall(function()
    return Drawing
end)

if s == false then
    warn("Shitsploit???", identifyexecutor())
end



getgenv().Console = loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/utils/console/main.lua"))() -- developed by upio :d

function CreateESPTag(params)
	local RunService = game:GetService("RunService")
	local player = game.Players.LocalPlayer
	local camera = game:GetService("Workspace").CurrentCamera

	local Text = params.Text
	local Part = params.Part
	local TextSize = params.TextSize
	local TextColor = params.TextColor
	local BoxColor = params.BoxColor
	local TracerColor = params.TracerColor or Color3.new(255, 255, 255)
	local TracerWidth = params.TracerWidth or 3
	local TrailMode = params.TrailMode or false
	local TrailColor = params.TrailColor or {Color3.new(255, 0, 0)} 
	local TrailWidth = params.TrailWidth or {2}

	if #TrailColor < 2 then
		TrailColor[2] = TrailColor[1]
	end

	if #TrailWidth < 2 then
		TrailWidth[2] = TrailWidth[1] -- Duplicate the width if only one is provided
	end

	local esp = Instance.new("BillboardGui")
	esp.Name = "esp"
	esp.Size = UDim2.new(0, 200, 0, 50)
	esp.StudsOffset = Vector3.new(0, Part.Size.Y + 2, 0) -- Adjusted offset for the label above the head
	esp.Adornee = Part
	esp.Parent = Part
	esp.AlwaysOnTop = true

	local esplabelfr = Instance.new("TextLabel")
	esplabelfr.Name = "esplabelfr"
	esplabelfr.Size = UDim2.new(1, 0, 0, 70)
	esplabelfr.BackgroundColor3 = Color3.new(0, 0, 0)
	esplabelfr.TextColor3 = TextColor or Color3.fromRGB(255, 255, 255)
	esplabelfr.BackgroundTransparency = 1
	esplabelfr.TextStrokeTransparency = 0
	esplabelfr.TextStrokeColor3 = Color3.new(0, 0, 0)
	esplabelfr.TextSize = TextSize
	esplabelfr.TextScaled = false
	esplabelfr.Font = "Arcade"
	esplabelfr.Parent = esp

	local box = Instance.new("BoxHandleAdornment")
	box.Name = "box"
	box.Size = Part.Size + Vector3.new(0.5, 0.5, 0.5)
	box.Adornee = Part
	box.AlwaysOnTop = true
	box.Transparency = 0.6
	box.Color3 = BoxColor or Color3.new(0, 0, 255)
	box.ZIndex = 0
	box.Parent = Part

	local tracerLine = Drawing.new("Line")
	tracerLine.Visible = false

	local trail = Instance.new("Trail")
	trail.Texture = "rbxassetid://188166667"
	trail.Attachment0 = Instance.new("Attachment", game.Players.LocalPlayer.Character.Torso)
	trail.Attachment1 = Instance.new("Attachment", Part)
	trail.Enabled = false
	trail.Color = ColorSequence.new(TrailColor[1], TrailColor[2])
	trail.WidthScale = NumberSequence.new(TrailWidth[1], TrailWidth[2])
	trail.Parent = Part
	trail.Lifetime = 0.5

	local function updateesplabelfr()
		if not Part or not Part:IsA("BasePart") or not Part.Parent then
			-- Part no longer exists, delete ESP elements
			esp:Destroy()
			if type(tracerLine) ~= "table" then
                tracerLine:Remove()
            end
			trail:Destroy()
			return
		end

		local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if playerPosition then
			local distance = (playerPosition.Position - Part.Position).Magnitude
			esplabelfr.Text = string.format(Text .. ": %.2f", distance)

			local headPosition = Part.Position + Vector3.new(0, Part.Size.Y / 2, 0)
			local screenPosition, onScreen = camera:WorldToScreenPoint(headPosition)

			if onScreen or playerPosition.Position.Y > Part.Position.Y then
				esp.Adornee = Part
				esp.Enabled = true
				box.Adornee = Part
				box.Visible = true

				-- Update tracer line points
				local tracerStart = camera:WorldToViewportPoint(player.Character:WaitForChild("Head").Position)
				local tracerEnd = camera:WorldToViewportPoint(Part.Position)
				tracerLine.From = Vector2.new(tracerStart.X, tracerStart.Y)
				tracerLine.To = Vector2.new(tracerEnd.X, tracerEnd.Y)
				tracerLine.Color = TracerColor
				tracerLine.Thickness = TracerWidth-- Adjust the thickness of the line (increased from 1)
				tracerLine.Visible = not TrailMode

				-- Update trail
				trail.Attachment1 = Part.Attachment
				trail.Lifetime = 0.3
				trail.Enabled = TrailMode
				trail.Color = ColorSequence.new(TrailColor[1], TrailColor[2])
				trail.WidthScale = NumberSequence.new(TrailWidth[1], TrailWidth[2])
			else
				esp.Enabled = false
				box.Visible = false
				tracerLine.Visible = false
				trail.Enabled = false
			end
		else
			esp.Enabled = false
			box.Visible = false
			tracerLine.Visible = false
			trail.Enabled = false
		end
	end

	RunService.RenderStepped:Connect(updateesplabelfr)
end

local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")

-- Player default variables

local LPLR = game.Players.LocalPlayer
local Character =
      --YieldForCharacterCon = 
      LPLR.Character
      --LPLR.CharacterAdded

--YieldForCharacterCon:Wait(0.25)

getgenv().Loaded = "YES!!!"
getgenv().cfspeed = false
getgenv().cframe_numspeed = 0.1
getgenv().rabbit = false
getgenv().rabbit_connection = nil

getgenv().NextbotESP = {};
getgenv().FieldOfView = 60
getgenv().CustomFOV = false

local function findFirstChild(parent, childName)
    if parent:FindFirstChild(childName) then
        return parent:FindFirstChild(childName)
    else
        return parent
    end
end

getgenv().Noclip = false
getgenv().ExclusivePlayers = { -- Put your new alt names here too
    [7350809687] = "Latteism_2024";
}

getgenv().PermissionLevel = 1

for Iterator_Or_Index, v in pairs(getgenv().ExclusivePlayers) do
    if LPLR.UserId == Iterator_Or_Index and LPLR.Name == v then
        getgenv().PermissionLevel += 1 -- no need for else statements it'll be the same
    end
end



--print"Hello":)
local ScriptSettings = {
    CFrameSpeed = {Min = 0.05, Default = 0.1, Maximum = 7.5} -- Updated to 7.5 bcz why not'
}

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local __old = identifyexecutor()
local identifyexecutor = function()
    return __old
end

local Window = Library:CreateWindow({
    Title = 'EVADE ['..tostring(game.PlaceId)..'] - '..identifyexecutor(),
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.35
})

-- Define default variables

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SpawnedPlayers = workspace.Game.Players

local function GetTableOfPlayerParts(plr) : table
    local Table = {}
    -- HumanoidPart nil
    -- Humanoid nil
    -- Torso nil

    for _, v in pairs(plr:GetChildren()) do
        if v.Name == "HumanoidRootPart" then
            Table["HumanoidPart"] = v
        elseif v.Name == "Humanoid" then
            Table[v.Name] = v
        elseif v.Name == "Torso" then
            table[v.Name] = v
        end
    end

    return Table
end

local function isplayer(model)
    return Players:FindFirstChild(model.Name) ~= nil and true or false
end

local function isnextbot(model)
    return model:FindFirstChild("HRP") and true or Players:FindFirstChild(model.Name) == nil and true or false 
end

local RS = game:GetService("RunService")

UserInput.JumpRequest:Connect(function()
    if getgenv().rabbit then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

RS.Heartbeat:Connect(function() -- Updating toggles sometimes
    local __heart = RS.Heartbeat:Wait();

    -- heartbeat yields

    if SpawnedPlayers:FindFirstChild(LocalPlayer.Name) then
        if getgenv().cfspeed and getgenv().cframe_numspeed then
            -- thx to inf yield
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            local minmag = 0;
            local character = LocalPlayer.Character

            if LocalPlayer.Character then
                if hum.MoveDirection.Magnitude > minmag then
                    character:TranslateBy(hum.MoveDirection * tonumber(
                        getgenv().cframe_numspeed
                    ) * __heart * 10)
                    task.wait(0.01);
                else
                    character:TranslateBy(hum.MoveDirection * __heart * 10)
                    task.wait(0.01);
                end
            end
        end;
        -- 1 : 70
        -- 2 : 120
        if getgenv().CustomFOV then
            game.Players.LocalPlayer.PlayerScripts.FOVAdjusters.Sprint.Value = getgenv().FieldOfView
            -- i don't know what localscript causes the handling of FOV but let's just use this I guess :content
        end

        local function NoclipLoop()
            if getgenv().Noclip == true and game.Players.LocalPlayer.Character ~= nil then
                for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if child:IsA("BasePart") and child.CanCollide == true then
                        child.CanCollide = false
                    end
                end
            else
                for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if child:IsA("BasePart") and child.CanCollide == false then
                        child.CanCollide = true
                    end
                end
            end
        end

        spawn(NoclipLoop);
    end
end)

local function __Noclip(bool)
    if game.Players.LocalPlayer.Character ~= nil then
        for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true then
                child.CanCollide = bool
            end
        end
    else
        for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == false then
                child.CanCollide = bool
            end
        end
    end
end

local Tabs = {
    Main = Window:AddTab('Main'),
    Servers = Window:AddTab('Servers'),
    OtherScripts = Window:AddTab('Other Games')
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Cheats')
--local RightGroupBox = Tabs.Main:AddRightGroupBox('Features Soon')
local LeftGroupBox_1 = Tabs.Servers:AddLeftGroupbox('Main')
local LeftGroupBox_2 = Tabs.OtherScripts:AddLeftGroupbox('Coming Soon!')

LeftGroupBox_2:AddLabel('Supported : Evade')
LeftGroupBox_2:AddLabel("Supported : Nico's Nextbots")
LeftGroupBox_2:AddLabel('Supported : DOORS [floor 2] (mspaint has this one)')
LeftGroupBox_2:AddLabel('Supported : More games coming soon :)')
LeftGroupBox_2:AddDivider()
LeftGroupBox_2:AddLabel('Current Game Name : ' .. (
    game:GetService("MarketplaceService"):GetProductInfo(
        game.PlaceId
    ).Name
))

LeftGroupBox:AddLabel(
    '[1] Current Game Id:'..tostring(
        game.GameId
    )..
    '\n[2] Current Job Id:'..tostring(
        game.JobId
    )..
    '\n[3] Game Version:'..math.floor(
        game.PlaceVersion / 100
    )..

    '.'..

    (
        math.floor(
            game.PlaceVersion / 10)
             % 10
        )..
    '.'..

    math.floor(
        game.PlaceVersion % 10
    )..

    '\n[4] Player Amount:'..tostring(
        #Players:GetPlayers()
    )..
    "", 
    true
)


--local PlaceName = game:GetService("MarketplaceService"):GetProductInfo(
  --  game.PlaceId
--).Name

--LeftGroupBox:AddLabel('Current Place Name : ' .. PlaceName)
LeftGroupBox:AddLabel('Current Place Id : ' .. tostring(game.PlaceId))
LeftGroupBox:AddLabel("Signed In As : " .. LPLR.Name)
coroutine.wrap(function()
    repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Menu") ~= nil
    LeftGroupBox:AddLabel("Tokens : " .. game:GetService("Players").LocalPlayer.PlayerGui.Menu.Left.Tokens.Cash.Text)
    LeftGroupBox:AddLabel("Survivals : " .. game:GetService("Players").LocalPlayer.PlayerGui.Menu.Left.Survivals.Cash.Text)
    LeftGroupBox:AddLabel("Points : " .. game:GetService("Players").LocalPlayer.PlayerGui.Menu.Left.Points.Cash.Text)
end)()

local CanUseJobIDTeleporter = true -- sad if you can't use it!

LeftGroupBox_1:AddButton({
    Text = 'Copy Job Id',
    Func = function()
        setclipboard(tostring(game.JobId))
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "JobId",
            Text = "Succesfully copied!",
            Duration = 5
        })
    end,
    DoubleClick = false,
    Tooltip = 'Copy Job Id to share or save server id'
})

--[[LeftGroupBox:AddInput('tpForJobid', {
    Default = 'Tp To JobId',
    Numeric = false,
    Finished = true,

    Text = 'Teleport to a jobid (from other exploit servers or as a serverhop)',
    Tooltip = "Use this input to teleport to another exploit server/friend's server/etc.",

    Placeholder = '',

    Callback = function(Value)
        warn("Job id test : " .. Value)
        local s,e = pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Value, LPLR)
        end)

        print("result : ", s, e)
    end
})]]

if CanUseJobIDTeleporter then
    
    LeftGroupBox_1:AddInput('tpForJobid', {
        Default = '[type jobid here]',
        Numeric = false,
        Finished = true,
    
        Text = 'Teleport to a jobid',
        Tooltip = "Use this input to teleport to another exploit server/friend's server/etc.",
    
        Placeholder = '',
    
        Callback = function(Value)
            warn("Job id test : " .. Value)
            local s,e = pcall(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Value, LPLR)
            end)

            print("result : ", s, e)
        end
    })

    local l__HttpService__l = game:GetService("HttpService")
    local A1 = game.PlaceId

    LeftGroupBox_1:AddButton({
        Text = 'Teleport Random Server',
        Func = function()
            local function A2()
                local A3 = "https://games.roblox.com/v1/games/" .. A1 .. "/servers/Public?limit=100"
                local A4 = request({
                    Url = A3,
                    Method = "GET"
                })
            
                if A4.StatusCode == 200 then
                    local A5 = l__HttpService__l:JSONDecode(A4.Body)
                    if #A5.data > 0 then
                        for _, A6 in pairs(A5.data) do
                            if A6.playing < A6.maxPlayers then
                                return A6.id
                            end
                        end
                    end
                    return nil -- Return nil if no non-full server is found
                else
                    return nil
                end
            end
            
            local A7 = A2();
            if A7 ~= nil then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, A7, LPLR)
            else
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Teleporter",
                    Text = "Servers not found.",
                    Duration = 5
                })
            end                          
        end,
        DoubleClick = false,
        Tooltip = 'Tp to a random server :p'
    })
end


local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;
local Time = os.date("%H:%M:%S", os.time())

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;
    Time = os.date("%H:%M:%S", os.time())

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('%s | %s | %s fps | %s ms | %s'):format(
        game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
        identifyexecutor(),
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue()),
        Time
    ));
end);


--[[LeftGroupBox:AddToggle('CFwalk', {
    Text = 'CFrame Walk',
    Default = false, -- Default value (true / false)
    Tooltip = 'Uses CFrame speed as a walkspeed method', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().cfspeed = Value
    end
})]]

LeftGroupBox:AddToggle('rabbit_mode', {
    Text = 'Infinite Jump',
    Default = false, -- Default value (true / false)
    Tooltip = 'Just basic infinite jumping', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().rabbit = Value
    end
})

--[[
    Example Usage:
    EspName : string, 
    item : obj, 
    displayText : string, 
    customizable : table, 
    highlightSettings : table
]]

--[[
    Example Usage on a player:

    Library:New("Erm", workspace["riuiqwira3"].Head, "Termed . . .", {
        Font = 5;
        Size = 20;
        TColor = Color3.fromRGB(0, 255, 0);
        T2Color = Color3.fromRGB(255,255,255);
        TracerThickness = 1
    }, {
        Using = true;
        FillColor = Color3.fromRGB(255,255,255);
        FillTransparency = 0.75;
        OutlineColor = Color3.fromRGB(0,0,0);
    }, {
        IsPlayer = true;
        PlayerName = "riuiqwira3",
        TableName = "Erm"
    })
]]

LeftGroupBox:AddButton({
    Text = 'ESP Nextbots [Automatic]',
    Func = function()
        local CoreGuiHighlight
        local function updateEsp(c)
            if isnextbot(c) then
                if c ~= nil then
                    if not c:FindFirstChild("created__") then
                        print("New for "..c.Name)
                        Instance.new("IntValue", c).Name = "created__"
                        -- i have updated the esp now:p
                        CreateESPTag({
                            Text = c.Name,
                            Part = c.PrimaryPart,
                            TextSize = 9,
                            TextColor = Color3.new(0.658823, 0.407843, 0.733333),
                            BoxColor = Color3.new(0.321568, 0.741176, 0.411764),
                            TracerColor = Color3.new(1, 1, 1),
                            TracerWidth = 3
                        })
                    end
                end
            end
        end

        -- checking

        for _, v in pairs(SpawnedPlayers:GetChildren()) do
            updateEsp(v)
        end

        SpawnedPlayers.ChildAdded:Connect(function(c)
            updateEsp(c)
        end)
    end,

    DoubleClick = false,
    Tooltip = 'Automatic ESP that updates current NPCs and spawned ones.'
})

FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1
IYMouse = game.Players.LocalPlayer:GetMouse()
local iyflyspeed = 1;

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local flyKeyDown, flyKeyUp

function sFLY(vfly)
	repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	repeat wait() until IYMouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = getRoot(Players.LocalPlayer.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat wait()
				if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

if getgenv().PermissionLevel > 1 then
    LeftGroupBox:AddLabel('Fly'):AddKeyPicker('KeyPicker', {    
    
        Default = 'V',
        SyncToggleState = false,
        Mode = 'Toggle', -- Always Toggle Hold
    
        Text = 'Player Fly',
        NoUI = false, 
    

        Callback = function(Value)
            if Value then
                NOFLY()
                wait()
                sFLY()
            else
                NOFLY()
            end
        end,
    
        ChangedCallback = function(New)
            getgenv().Console.custom_print(">>> new keybind for fly :", New, "", Color3.fromRGB(84, 204, 90))
        end
    })

    LeftGroupBox:AddSlider('__flyspeed', {
        Text = 'Fly Speed',
        Default = 1,
        Min = 1,
        Max = 5,
        Rounding = 1,
        Compact = false,
    
        Callback = function(Value)
            iyflyspeed = Value
        end
    })
end

--[[LeftGroupBox:AddButton('esp_nextbots', {
    Text = 'ESP Nextbots [Automatic]',
    Func = function()
            local CoreGuiHighlight
            local function updateEsp(c)
                if isnextbot(c) then
                    if not table.find(espnextbots, v.Name) then
                        table.insert(espnextbots, v.Name)
                        CreateESPTag({
			                Text = v.Name,
			                Part = v.PrimaryPart,
			                TextSize = 15,
			                TextColor = Color3.new(255,0,255),
			                BoxColor = Color3.new(0,0,255),
			                TracerColor = Color3.new(255,255,255),
			                TracerWidth = 3
		                }) 
                    end
                end
            end

            for _, v in pairs(SpawnedPlayers:GetChildren()) do
                updateEsp(v)
            end

            SpawnedPlayers.ChildAdded:Connect(function(c)
                updateEsp(c)
            end)
        --end
    end,
    DoubleClick = false,
    Tooltip = 'Automatic ESP that updates current NPCs and spawned ones.', -- Information shown when you hover over the toggle
})]]

local no_fog = LeftGroupBox:AddButton({
    Text = 'No Fog',
    Func = function()
        -- supposing theres an atmosphere
        local serv = game:FindService("Lighting")
        local atmosphere = findFirstChild(serv, "Atmosphere")

        if atmosphere then
            atmosphere.Density = 0
            atmosphere.Glare = 0
            atmosphere.Haze = 0
            atmosphere.Color = Color3.fromRGB(255,255,255);
            atmosphere.Decay = Color3.fromRGB(255,255,255);
            getgenv().Console.custom_print(">>> succesfully set atmosphere's settings to unreadable.", "", Color3.fromRGB(220,220,170))
        else
            getgenv().Console.custom_print(">>> failed to find atmosphere or returned error, typeof atmosphere: " .. atmosphere .. ".", "", Color3.fromRGB(170,170,120))
            return;
        end
    end,
    DoubleClick = false,
    Tooltip = 'Sets lightings fog to null :p'
})

LeftGroupBox:AddButton({
    Text = 'Fullbright',
    Func = function()
        -- supposing theres an atmosphere
        local serv = game:FindService("Lighting")
        local atmosphere = findFirstChild(serv, "Atmosphere")

        serv.Brightness = 2
        serv.ClockTime = 14
        serv.FogEnd = 100000
        serv.GlobalShadows = false
        serv.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        getgenv().Console.custom_print(">>> succesfully enabled fullbright", "", Color3.fromRGB(84, 204, 90))
    end,
    DoubleClick = false,
    Tooltip = 'Just fullbright, idk what else :p'
})

LeftGroupBox:AddToggle('fov_toggle', {
    Text = 'Custom FOV',
    Default = false,
    Tooltip = 'Customizable Field Of View', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().CustomFOV = Value
    end
})

LeftGroupBox:AddLabel('Noclip'):AddKeyPicker('KeyPicker', {    
    
    Default = 'N',
    SyncToggleState = false,
    Mode = 'Toggle', -- Always Toggle Hold

    Text = 'Noclip',
    NoUI = false, 


    Callback = function(Value)
        __Noclip(Value)
    end,

    ChangedCallback = function(New)
        getgenv().Console.custom_print(">>> new keybind for noclip :", New, "", Color3.fromRGB(84, 204, 90))
    end
})

LeftGroupBox:AddLabel('CFrame Walking'):AddKeyPicker('KeyPicker', {    
    
    Default = 'B',
    SyncToggleState = false,
    Mode = 'Toggle', -- Always Toggle Hold

    Text = 'CFrame Walk',
    NoUI = false, 


    Callback = function(Value)
        getgenv().cfspeed = Value
    end,

    ChangedCallback = function(New)
        getgenv().Console.custom_print(">>> new keybind for fly :", New, "", Color3.fromRGB(84, 204, 90))
    end
})

LeftGroupBox:AddToggle('123-.', {
    Text = 'Noclip',
    Default = false, -- Default value (true / false)
    Tooltip = 'A noclip that is functional (bots can tp to you btw so careful)', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().Noclip = Value
    end
})

LeftGroupBox:AddSlider('CFspeed', {
    Text = 'CFrame speed',
    Default = ScriptSettings.CFrameSpeed.Default,
    Min = ScriptSettings.CFrameSpeed.Min,
    Max = ScriptSettings.CFrameSpeed.Maximum,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().cframe_numspeed = Value
    end
})

LeftGroupBox:AddSlider('FOV', {
    Text = 'Field Of View',
    Default = 1,
    Min = 1,
    Max = 2,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().FieldOfView = Value
    end
})
Library.KeybindFrame.Visible = true; -- todo: add a function for this
Library:OnUnload(function()
    WatermarkConnection:Disconnect()
    Library.Unloaded = true
end)
