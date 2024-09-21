local RSPYenabled = false

local RemoteSpyGUI = Instance.new("ScreenGui")
local Outline = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
Title.RichText = true
local UIGradient = Instance.new("UIGradient")
local RemoteSpy = Instance.new("Frame")
local Remotes = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UICorner_2 = Instance.new("UICorner")
local Template = Instance.new("TextLabel")
local LilStar = Instance.new("ImageButton")
local RemoteSearch = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local RemoteSpyTab = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local RemoteSpyToggle = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local RemoteStatus = Instance.new("TextLabel")
local UICorner_6 = Instance.new("UICorner")
local Close = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local SpaceIn = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local EnableInvokeClientEvents = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local EnableInvokeServerEvents = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local EnableRemoteEvents = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local EnableClientEvents = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local StarBack = Instance.new("ImageButton")
local LilStar_2 = Instance.new("ImageButton")

--Properties:

RemoteSpyGUI.Name = "RemoteSpyGUI"
RemoteSpyGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
RemoteSpyGUI.ResetOnSpawn = false

Outline.Name = "Outline"
Outline.Parent = RemoteSpyGUI
Outline.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
Outline.BorderSizePixel = 2
Outline.Position = UDim2.new(0.430434793, -210, 0.464907259, -185)
Outline.Size = UDim2.new(0, 663, 0, 426)

UICorner.Parent = Outline

Title.Name = "Title"
Title.Parent = Outline
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 663, 0, 16)
Title.Font = Enum.Font.SourceSans
Title.Text = "Remote Spy - <font color=\"rgb(255,125,0)\">Artemis</font>  -  ( INSERT to toggle  )"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextYAlignment = Enum.TextYAlignment.Top

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient.Rotation = -11
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.03), NumberSequenceKeypoint.new(1.00, 0.03)}
UIGradient.Parent = Outline

RemoteSpy.Name = "RemoteSpy"
RemoteSpy.Parent = Outline
RemoteSpy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RemoteSpy.BackgroundTransparency = 1.000
RemoteSpy.BorderColor3 = Color3.fromRGB(0, 0, 0)
RemoteSpy.BorderSizePixel = 0
RemoteSpy.Position = UDim2.new(0, 0, -3.58187542e-08, 0)
RemoteSpy.Size = UDim2.new(0, 663, 0, 425)

Remotes.Name = "Remotes"
Remotes.Parent = RemoteSpy
Remotes.BackgroundTransparency = 1.000
Remotes.BorderColor3 = Color3.fromRGB(0, 0, 0)
Remotes.BorderSizePixel = 0
Remotes.Position = UDim2.new(0, 167, 0, 67)
Remotes.Size = UDim2.new(0.755656123, -10, 0.855036914, -50)
Remotes.CanvasSize = UDim2.new(0, 1000, 0, 0)
Remotes.ScrollBarThickness = 6
Remotes.VerticalScrollBarInset = Enum.ScrollBarInset.Always

UIListLayout.Parent = Remotes
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

UICorner_2.Parent = Remotes

Template.Name = "Template"
Template.Parent = Remotes
Template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Template.BackgroundTransparency = 1.000
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(0, 653, 0, 23)
Template.Font = Enum.Font.SourceSans
Template.Text = ""
Template.TextColor3 = Color3.fromRGB(255, 255, 255)
Template.TextSize = 14.000
Template.TextYAlignment = Enum.TextYAlignment.Top

local CopyPath = Instance.new("TextButton")
CopyPath.Visible = false
local CopyArgs = Instance.new("TextButton")
local CopyCaller = Instance.new("TextButton")
CopyArgs.Visible = false
CopyCaller.Visible = false

CopyArgs.Name = "CopyArgs"
CopyArgs.Parent = Template
CopyArgs.Active = false
CopyArgs.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
CopyArgs.BorderColor3 = Color3.fromRGB(0, 0, 0)
CopyArgs.BorderSizePixel = 0
CopyArgs.Position = UDim2.new(1.14548242, 0, 0.34117648, 0)
CopyArgs.Selectable = false
CopyArgs.Size = UDim2.new(0, 248, 0, 27)
CopyArgs.Font = Enum.Font.SourceSans
CopyArgs.Text = "Copy Args"
CopyArgs.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyArgs.TextScaled = true
CopyArgs.TextSize = 14.000
CopyArgs.TextWrapped = true
CopyArgs.TextYAlignment = Enum.TextYAlignment.Top

CopyCaller.Name = "CopyCaller"
CopyCaller.Parent = Template
CopyCaller.Active = false
CopyCaller.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
CopyCaller.BorderColor3 = Color3.fromRGB(0, 0, 0)
CopyCaller.BorderSizePixel = 0
CopyCaller.Position = UDim2.new(1.14548242, 0, 0.694117665, 0)
CopyCaller.Selectable = false
CopyCaller.Size = UDim2.new(0, 248, 0, 27)
CopyCaller.Font = Enum.Font.SourceSans
CopyCaller.Text = "Copy Caller Script"
CopyCaller.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyCaller.TextScaled = true
CopyCaller.TextSize = 14.000
CopyCaller.TextWrapped = true
CopyCaller.TextYAlignment = Enum.TextYAlignment.Top

CopyPath.Name = "CopyPath"
CopyPath.Parent = Template
CopyPath.Active = false
CopyPath.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
CopyPath.BorderColor3 = Color3.fromRGB(0, 0, 0)
CopyPath.BorderSizePixel = 0
CopyPath.Position = UDim2.new(1.14548242, 0, -0.0117647061, 0)
CopyPath.Selectable = false
CopyPath.Size = UDim2.new(0, 255, 0, 27)
CopyPath.Font = Enum.Font.SourceSans
CopyPath.Text = "Copy Path"
CopyPath.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyPath.TextScaled = true
CopyPath.TextSize = 14.000
CopyPath.TextWrapped = true
CopyPath.TextYAlignment = Enum.TextYAlignment.Top

LilStar.Name = "LilStar"
LilStar.Parent = RemoteSpy
LilStar.BackgroundTransparency = 1.000
LilStar.LayoutOrder = 5
LilStar.Position = UDim2.new(0.961538434, 0, 0, 0)
LilStar.Size = UDim2.new(0, 25, 0, 25)
LilStar.ZIndex = 2
LilStar.Image = "rbxassetid://3926305904"
LilStar.ImageColor3 = Color3.fromRGB(255, 248, 215)
LilStar.ImageRectOffset = Vector2.new(116, 4)
LilStar.ImageRectSize = Vector2.new(24, 24)
LilStar.ImageTransparency = 0.430

RemoteSearch.Name = "RemoteSearch"
RemoteSearch.Parent = RemoteSpy
RemoteSearch.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
RemoteSearch.BorderColor3 = Color3.fromRGB(0, 0, 0)
RemoteSearch.BorderSizePixel = 0
RemoteSearch.Position = UDim2.new(0, 45, 0, 41)
RemoteSearch.Size = UDim2.new(0.941176474, -45, -0.0328638479, 30)
RemoteSearch.PlaceholderText = "Search for remotes"
RemoteSearch.Text = ""
RemoteSearch.TextColor3 = Color3.fromRGB(255, 255, 255)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = RemoteSearch

RemoteSpyTab.Name = "RemoteSpyTab"
RemoteSpyTab.Parent = RemoteSpy
RemoteSpyTab.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
RemoteSpyTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
RemoteSpyTab.BorderSizePixel = 0
RemoteSpyTab.Position = UDim2.new(0.488687783, -35, 0.924902081, 5)
RemoteSpyTab.Size = UDim2.new(0, 234, 0, 18)
RemoteSpyTab.Text = "Remote Spy"
RemoteSpyTab.TextColor3 = Color3.fromRGB(255, 255, 255)

UICorner_4.CornerRadius = UDim.new(0, 0)
UICorner_4.Parent = RemoteSpyTab

RemoteSpyToggle.Name = "RemoteSpyToggle"
RemoteSpyToggle.Parent = RemoteSpy
RemoteSpyToggle.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
RemoteSpyToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
RemoteSpyToggle.BorderSizePixel = 0
RemoteSpyToggle.Position = UDim2.new(0.304675728, -35, 0.924902022, 5)
RemoteSpyToggle.Size = UDim2.new(0, 72, 0, 18)
RemoteSpyToggle.Text = "Toggle"
RemoteSpyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
RemoteSpyToggle.TextScaled = true
RemoteSpyToggle.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0, 0)
UICorner_5.Parent = RemoteSpyToggle

RemoteStatus.Name = "RemoteStatus"
RemoteStatus.Parent = RemoteSpy
RemoteStatus.Active = true
RemoteStatus.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
RemoteStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
RemoteStatus.BorderSizePixel = 0
RemoteStatus.Position = UDim2.new(0.0754147843, -35, 0.924902022, 5)
RemoteStatus.Selectable = true
RemoteStatus.Size = UDim2.new(0, 143, 0, 18)
RemoteStatus.Text = "Remote Spy Status : OFF"
RemoteStatus.TextColor3 = Color3.fromRGB(255, 255, 255)

UICorner_6.CornerRadius = UDim.new(0, 0)
UICorner_6.Parent = RemoteStatus

Close.Name = "Close"
Close.Parent = RemoteSpy
Close.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.882352948, -35, 0.924902022, 5)
Close.Size = UDim2.new(0, 104, 0, 18)
Close.Text = "Close"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)

UICorner_7.CornerRadius = UDim.new(0, 0)
UICorner_7.Parent = Close

SpaceIn.Name = "SpaceIn"
SpaceIn.Parent = RemoteSpy
SpaceIn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpaceIn.BackgroundTransparency = 1.000
SpaceIn.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpaceIn.BorderSizePixel = 0
SpaceIn.Position = UDim2.new(0.051282052, 0, 0.188235298, 0)
SpaceIn.Size = UDim2.new(0, 104, 0, 239)

UIListLayout_2.Parent = SpaceIn
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

EnableInvokeClientEvents.Name = "EnableInvokeClientEvents"
EnableInvokeClientEvents.Parent = SpaceIn
EnableInvokeClientEvents.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
EnableInvokeClientEvents.BorderColor3 = Color3.fromRGB(0, 0, 0)
EnableInvokeClientEvents.BorderSizePixel = 0
EnableInvokeClientEvents.Position = UDim2.new(0.104072399, -35, 0.176666766, 5)
EnableInvokeClientEvents.Size = UDim2.new(0, 104, 0, 30)
EnableInvokeClientEvents.Text = "Enable InvokeClient Events"
EnableInvokeClientEvents.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableInvokeClientEvents.TextScaled = true
EnableInvokeClientEvents.TextWrapped = true

UICorner_8.CornerRadius = UDim.new(0, 0)
UICorner_8.Parent = EnableInvokeClientEvents

EnableInvokeServerEvents.Name = "EnableInvokeServerEvents"
EnableInvokeServerEvents.Parent = SpaceIn
EnableInvokeServerEvents.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
EnableInvokeServerEvents.BorderColor3 = Color3.fromRGB(0, 0, 0)
EnableInvokeServerEvents.BorderSizePixel = 0
EnableInvokeServerEvents.Position = UDim2.new(0.104072399, -35, 0.176666766, 5)
EnableInvokeServerEvents.Size = UDim2.new(0, 104, 0, 30)
EnableInvokeServerEvents.Text = "Enable InvokeServer Events"
EnableInvokeServerEvents.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableInvokeServerEvents.TextScaled = true
EnableInvokeServerEvents.TextWrapped = true

UICorner_9.CornerRadius = UDim.new(0, 0)
UICorner_9.Parent = EnableInvokeServerEvents

EnableRemoteEvents.Name = "EnableRemoteEvents"
EnableRemoteEvents.Parent = SpaceIn
EnableRemoteEvents.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
EnableRemoteEvents.BorderColor3 = Color3.fromRGB(0, 0, 0)
EnableRemoteEvents.BorderSizePixel = 0
EnableRemoteEvents.Position = UDim2.new(0.104072399, -35, 0.176666766, 5)
EnableRemoteEvents.Size = UDim2.new(0, 104, 0, 30)
EnableRemoteEvents.Text = "Enable Remote Events"
EnableRemoteEvents.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableRemoteEvents.TextScaled = true
EnableRemoteEvents.TextWrapped = true

UICorner_10.CornerRadius = UDim.new(0, 0)
UICorner_10.Parent = EnableRemoteEvents

EnableClientEvents.Name = "EnableClientEvents"
EnableClientEvents.Parent = SpaceIn
EnableClientEvents.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
EnableClientEvents.BorderColor3 = Color3.fromRGB(0, 0, 0)
EnableClientEvents.BorderSizePixel = 0
EnableClientEvents.Position = UDim2.new(0.104072399, -35, 0.176666766, 5)
EnableClientEvents.Size = UDim2.new(0, 104, 0, 30)
EnableClientEvents.Text = "Enable Client Events"
EnableClientEvents.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableClientEvents.TextScaled = true
EnableClientEvents.TextWrapped = true

UICorner_11.CornerRadius = UDim.new(0, 0)
UICorner_11.Parent = EnableClientEvents

StarBack.Name = "StarBack"
StarBack.Parent = Outline
StarBack.BackgroundTransparency = 1.000
StarBack.LayoutOrder = 5
StarBack.Position = UDim2.new(0.961538434, 0, 0, 0)
StarBack.Size = UDim2.new(0, 25, 0, 25)
StarBack.ZIndex = 2
StarBack.Image = "rbxassetid://3926305904"
StarBack.ImageColor3 = Color3.fromRGB(255, 248, 215)
StarBack.ImageRectOffset = Vector2.new(116, 4)
StarBack.ImageRectSize = Vector2.new(24, 24)
StarBack.ImageTransparency = 0.430

LilStar_2.Name = "LilStar"
LilStar_2.Parent = Outline
LilStar_2.BackgroundTransparency = 1.000
LilStar_2.LayoutOrder = 5
LilStar_2.Position = UDim2.new(0.961538434, 0, 0, 0)
LilStar_2.Size = UDim2.new(0, 25, 0, 25)
LilStar_2.ZIndex = 2
LilStar_2.Image = "rbxassetid://3926305904"
LilStar_2.ImageColor3 = Color3.fromRGB(255, 248, 215)
LilStar_2.ImageRectOffset = Vector2.new(116, 4)
LilStar_2.ImageRectSize = Vector2.new(24, 24)
LilStar_2.ImageTransparency = 0.430

RemoteSpyToggle.MouseButton1Click:Connect(function()
	if not RSPYenabled then
		RSPYenabled = true
		RemoteStatus.Text = "Remote Spy Status : ON"
	else
		RSPYenabled = false
		RemoteStatus.Text = "Remote Spy Status : OFF"
	end
end)

local isToggled = false
local isDragging = false
local dragStart = nil
local startPos = nil
local userInputService = game:GetService("UserInputService")

Close.MouseButton1Click:Connect(function()
	RemoteSpyGUI.Enabled = false
	isToggled = true
end)

Outline.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isDragging = true
		dragStart = input.Position
		startPos = Outline.Position
	end
end)

Outline.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		userInputService.InputChanged:Connect(function(input)
			if isDragging then
				local delta = input.Position - dragStart
				Outline.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
		end)
	end
end)

userInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isDragging = false
	end
end)

local Notify = function(title,text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title, Text = text, Duration = 5
    })
end

userInputService.InputBegan:Connect(function(inp, gpro)
	if gpro then
		return
	end

	if inp.KeyCode == Enum.KeyCode.Insert then
		if not isToggled then
			isToggled = true
			RemoteSpyGUI.Enabled = false
		else
			isToggled = false
			RemoteSpyGUI.Enabled = true
		end
	end
end)


local remotes = {}
local function formatArgs(args)
	if #args == 0 then
		return ""
	end

	local formatted = {}
	for _, v in ipairs(args) do
		if typeof(v) == "string" then
			table.insert(formatted, '"' .. v .. '"')
		elseif typeof(v) == "number" then
			table.insert(formatted, tostring(v))
		elseif typeof(v) == "Instance" then
			table.insert(formatted, v:GetFullName())
		else
			table.insert(formatted, tostring(v))
		end
	end
	return table.concat(formatted, ", ")
end

local function NEWUIS(parent,sm,color,thick,parency)
	local ui = Instance.new("UIStroke")
	ui.ApplyStrokeMode = sm
	ui.Color = color
	ui.Thickness = thick
	ui.Transparency = parency
	ui.Parent = parent
	return ui
end

local function randomColor()
	local colors = {
		Color3.fromRGB(91, 90, 90),
		Color3.fromRGB(101, 87, 255),
		Color3.fromRGB(133, 255, 39),
		Color3.fromRGB(163, 163, 163),
		Color3.fromRGB(140, 255, 203)
	}
	
	return colors[math.random(1, #colors)]
end

local function on_remote_dtc(remotePath, method, args, callerScript)
	local formattedArgs = formatArgs(args)
	local text = string.format("game.%s:%s(%s)", remotePath, method, formattedArgs)
	local formatDiz = ("Remote Path : %s\nMethod : %s\nArguments : %s\nCaller Script : %s"):format(
		remotePath, method, formattedArgs, callerScript
	)

	local textLabel = Template:Clone()
	textLabel.Text = formatDiz
	textLabel.BackgroundTransparency = 1
	textLabel.Parent = Remotes
	textLabel.Visible = true
	textLabel.Size = UDim2.new(0, 653, 0, 85)
	textLabel.TextScaled = true
	textLabel.TextColor3 = randomColor()
	textLabel:WaitForChild("CopyPath").Visible = true
	textLabel:WaitForChild("CopyArgs").Visible = true
	textLabel:WaitForChild("CopyCaller").Visible = true
	textLabel.CopyPath.TextScaled = true
	textLabel.CopyPath.Text = "Copy Remote"
	textLabel.CopyPath.Size = UDim2.new(0, 248, 0, 27)
	--UIListLayout.Padding = UDim.new(0, 15)

	textLabel.CopyPath.MouseButton1Click:Connect(function()
		local copy = setclipboard or copy_clipboard or set_to_clipboard or copytoclipboard
		if copy ~= nil then
			copy(remotePath)
            Notify(
					"Path", 
					("Copied [%s]"):format(
					remotePath
					)
			)
		end
	end)
	
	textLabel.CopyArgs.MouseButton1Click:Connect(function()
		local copy = setclipboard or copy_clipboard or set_to_clipboard or copytoclipboard
		if copy ~= nil then
			copy(formattedArgs)
            Notify("Args", "Copied ["..formattedArgs.."]")
		end
	end)
	
	textLabel.CopyCaller.MouseButton1Click:Connect(function()
		local copy = setclipboard or copy_clipboard or set_to_clipboard or copytoclipboard
		if copy ~= nil then
			copy(callerScript)
            Notify("Caller", "Copied ["..callerScript.."]")
		end
	end)
	
	local x0 = NEWUIS(textLabel, Enum.ApplyStrokeMode.Border, randomColor(), 2, 0)
	local x0 = NEWUIS(textLabel.CopyPath, Enum.ApplyStrokeMode.Border, randomColor(), 2, 0)
	local x0 = NEWUIS(textLabel.CopyArgs, Enum.ApplyStrokeMode.Border, randomColor(), 2, 0)
	local x0 = NEWUIS(textLabel.CopyCaller, Enum.ApplyStrokeMode.Border, randomColor(), 2, 0)
	
	Remotes.CanvasSize = UDim2.new(0, 1000, 0, UIListLayout.AbsoluteContentSize.Y)

	table.insert(remotes, textLabel)
end

local function filterEntries()
	local searchText = RemoteSearch.Text:lower()
	for _, entry in ipairs(remotes) do
		entry.Visible = entry.Text:lower():find(searchText, 1, true) ~= nil
	end

	Remotes.CanvasSize = UDim2.new(0, 1000, 0, UIListLayout.AbsoluteContentSize.Y)
end

RemoteSearch:GetPropertyChangedSignal("Text"):Connect(filterEntries)



-- UISTROKES

local x0 = NEWUIS(EnableClientEvents, Enum.ApplyStrokeMode.Border, Color3.fromRGB(0,0,0), 2.7, 0)
local x0 = NEWUIS(EnableInvokeClientEvents, Enum.ApplyStrokeMode.Border, Color3.fromRGB(0,0,0), 2.7, 0)
local x0 = NEWUIS(EnableInvokeServerEvents, Enum.ApplyStrokeMode.Border, Color3.fromRGB(0,0,0), 2.7, 0)
local x0 = NEWUIS(EnableRemoteEvents, Enum.ApplyStrokeMode.Border, Color3.fromRGB(0,0,0), 2.7, 0)

local x0 = NEWUIS(Remotes, Enum.ApplyStrokeMode.Border, Color3.fromRGB(86, 67, 67), 2.7, 0)
local x0 = NEWUIS(Close, Enum.ApplyStrokeMode.Border, Color3.fromRGB(0,0,0), 2.7, 0)
local x0 = NEWUIS(RemoteSearch, Enum.ApplyStrokeMode.Border, Color3.fromRGB(255, 198, 85), 2.7, 0)
local x0 = NEWUIS(RemoteSpyTab, Enum.ApplyStrokeMode.Border, Color3.fromRGB(0,0,0), 2.7, 0)
local x0 = NEWUIS(RemoteSpyToggle, Enum.ApplyStrokeMode.Border, Color3.fromRGB(0,0,0), 2.7, 0)
local x0 = NEWUIS(RemoteStatus, Enum.ApplyStrokeMode.Border, Color3.fromRGB(157, 107, 107), 2.7, 0)

local CLE = true
local CE = true
local SE = true
local RE = true

local txt = "%s %s"

EnableRemoteEvents.MouseButton1Click:Connect(function()
	if not RE then
		RE = false
		EnableRemoteEvents.Text = txt:format("Enable", "Remote Events")
	else
		RE = true
		EnableRemoteEvents.Text = txt:format("Disable", "Remote Events")
	end
end)

EnableClientEvents.MouseButton1Click:Connect(function()
	if not CLE then
		CLE = false
		EnableClientEvents.Text = txt:format("Enable", "Client Events")
	else
		CLE = true
		EnableClientEvents.Text = txt:format("Disable", "Client Events")
	end
end)

EnableInvokeClientEvents.MouseButton1Click:Connect(function()
	if not CE then
		CE = false
		EnableInvokeClientEvents.Text = txt:format("Enable", "InvokeClient Events")
	else
		CE = true
		EnableInvokeClientEvents.Text = txt:format("Disable", "InvokeClient Events")
	end
end)

EnableInvokeServerEvents.MouseButton1Click:Connect(function()
	if not SE then
		SE = false
		EnableInvokeServerEvents.Text = txt:format("Enable", "InvokeServer Events")
	else
		SE = true
		EnableInvokeServerEvents.Text = txt:format("Disable", "InvokeServer Events")
	end
end)

RemoteSpyTab.MouseButton1Click:Connect(function()
	RemoteSpy.Visible = true
end)

-- the event toggles are a lil bit broken yet i will fix it later

-- now the real rspy
-- example
--[[for i=1,10 do
	on_remote_dtc(game.ReplicatedStorage.TestRemote:GetFullName(), "FireServer", {
		[1] = "test remote:p"
	}, "Idk")
	task.wait(1)
end]]

local mt = getrawmetatable(game)
local old = mt.__namecall 

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
	local args = {...}
	local method = getnamecallmethod()
	if method == 'FireServer' or method == 'FireClient' or method == 'InvokeServer' or method == 'InvokeClient' then
		local remotePath = self:GetFullName()
		local callerScript = rawget(getfenv(0), 'script') and rawget(getfenv(0), 'script'):GetFullName() or "Unknown"
		-- checking for toggles

		if RSPYenabled then
			if RE then
				if method == 'FireServer' then
					on_remote_dtc(remotePath, method, args, callerScript)
				end
			end

			if CLE then
				if method == "FireClient" then
					on_remote_dtc(remotePath, method, args, callerScript)
				end
			end

			if CE then
				if method == "InvokeClient" then
					on_remote_dtc(remotePath, method, args, callerScript)
				end
			end

			if SE then
				if method == "InvokeServer" then
					on_remote_dtc(remotePath, method, args, callerScript)
				end
			end
		end
	end 
	return old(self, ...)
end)

setreadonly(mt, true)
