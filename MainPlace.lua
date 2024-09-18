if getgenv().Loaded then
    return;
end

local espnextbots = {}
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

    repeat
        task.wait();
    until Part ~= nil

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


	local function updateesplabelfr()
		if not Part or not Part:IsA("BasePart") or not Part.Parent then
			-- Part no longer exists, delete ESP elements
			if esp then
                esp:Destroy()
            end
			if tracerLine then
                tracerLine.Visible = false
            end
			if trail then
                trail:Destroy()
            end
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
				local tracerStart = camera:WorldToViewportPoint(player.Character.Head.Position)
				local tracerEnd = camera:WorldToViewportPoint(Part.Position)
				tracerLine.From = Vector2.new(tracerStart.X, tracerStart.Y)
				tracerLine.To = Vector2.new(tracerEnd.X, tracerEnd.Y)
				tracerLine.Color = TracerColor
				tracerLine.Thickness = TracerWidth-- Adjust the thickness of the line (increased from 1)
				tracerLine.Visible = not TrailMode

				-- Update trail

                local s,e = pcall(function()
                    return trail.Attachment1
                end)

                if not s then
                    --warn("fail to get trail")
                else
                    trail.Attachment1 = Part.Attachment
                    trail.Lifetime = 0.3
                    trail.Enabled = TrailMode
                    trail.Color = ColorSequence.new(TrailColor[1], TrailColor[2])
                    trail.WidthScale = NumberSequence.new(TrailWidth[1], TrailWidth[2])
                end
			else
				esp.Enabled = false
				box.Visible = false
				tracerLine.Visible = false
                if trail then
                    trail.Enabled = true
                end
			end
		else
			esp.Enabled = false
			box.Visible = false
			tracerLine.Visible = false
            if trail then
                trail.Enabled = false
            end
		end
	end

	RunService.RenderStepped:Connect(updateesplabelfr)
end

local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")

-- Player default variables

local LPLR = game.Players.LocalPlayer
local Character,
      YieldForCharacterCon = 
      LPLR.Character,
      LPLR.CharacterAdded

YieldForCharacterCon:Wait(0.25)

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
getgenv().AdminTable = { -- Put your new alt names here too
    [7350809687] = "Latteism_2024";
}

getgenv().PermissionLevel = 1

for Iterator_Or_Index, v in pairs(getgenv().AdminTable) do
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

local Window = Library:CreateWindow({
    Title = 'EVADE ['..tostring(game.PlaceId)..'] - '..identifyexecutor(),
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
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
    return Players:FindFirstChild(model.Name) == nil and true or false
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

local Tabs = {
    Main = Window:AddTab('Main'),
    Shop = Window:AddTab('Game Shop'),
    OtherScripts = Window:AddTab('Other Games')
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Groupbox')
--local PlaceName = game:GetService("MarketplaceService"):GetProductInfo(
  --  game.PlaceId
--).Name

--LeftGroupBox:AddLabel('Current Place Name : ' .. PlaceName)
LeftGroupBox:AddLabel('Current Place Id : ' .. tostring(game.PlaceId))
LeftGroupBox:AddLabel("Signed In As : " .. LPLR.Name)
LeftGroupBox:AddLabel("Tokens : " .. game:GetService("Players").LocalPlayer.PlayerGui.Menu.Left.Tokens.Cash.Text)
LeftGroupBox:AddLabel("Survivals : " .. game:GetService("Players").LocalPlayer.PlayerGui.Menu.Left.Survivals.Cash.Text)
LeftGroupBox:AddLabel("Points : " .. game:GetService("Players").LocalPlayer.PlayerGui.Menu.Left.Points.Cash.Text)



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

    Library:SetWatermark(('EVADE | %s | %s fps | %s ms | %s'):format(
        identifyexecutor(),
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue()),
        Time
    ));
end);


LeftGroupBox:AddToggle('CFwalk', {
    Text = 'CFrame Walk',
    Default = false, -- Default value (true / false)
    Tooltip = 'Uses CFrame speed as a walkspeed method', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().cfspeed = Value
    end
})

LeftGroupBox:AddToggle('rabbit_mode', {
    Text = 'Infinite Jump',
    Default = false, -- Default value (true / false)
    Tooltip = 'Just basic infinite jumping', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().rabbit = Value
    end
})

LeftGroupBox:AddButton('esp_nextbots', {
    Text = 'ESP Nextbots [Automatic]',
    Tooltip = 'Automatic ESP that updates current NPCs and spawned ones.', -- Information shown when you hover over the toggle
    DoubleClick = false
    Func = function()
        --if getgenv().NextbotESP then
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
    end
})

local clear_esp = LeftGroupBox:AddButton({
    Text = 'Clear ESP',
    Func = function()
        table.clear(espnextbots)
    end,
    DoubleClick = false,
    Tooltip = 'Click this button to clear ESP list (so it can ESP new bots)'
})

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

LeftGroupBox:AddToggle('fov_toggle', {
    Text = 'Custom FOV',
    Default = false,
    Tooltip = 'Customizable Field Of View', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().CustomFOV = Value
    end
})

LeftGroupBox:AddToggle('123-.', {
    Text = 'Noclip',
    Default = false, -- Default value (true / false)
    Tooltip = 'A noclip that is functional (bots can tp to you btw)', -- Information shown when you hover over the toggle

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
