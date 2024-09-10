local Library = {}
Library.ESP = {}
Library.DebugMode = _G.Debug == true and true or false



-- Function to remove ESP by name
function Library:Remove(name)
    for index, i in pairs(Library.ESP) do
        if i.Name == name then
            -- Hide the visuals
            i.TxT.Visible = false
            i.Tracer.Visible = false
            i.TxT:Remove()
            i.Tracer:Remove()

            if i.highlight ~= nil then
                i.highlight:Remove()
            end

            if game:GetService("CoreGui"):FindFirstChild(name) then
                game:GetService("CoreGui")[name]:Remove()
            end

            -- Find the index and remove the element
            local indx = table.find(Library.ESP, i)
            if indx then
                table.clear(Library.ESP[indx])
                table.remove(Library.ESP, indx)
                if Library.DebugMode then
                    warn("Removed ESP for: " .. name)
                    warn("Debug the Index : " .. tostring(indx))
                    warn("Does table exist : " .. (Library.ESP[indx] ~= nil and "true" or "false"))
                end
            end
            break
        end
    end
end

local cam = workspace.CurrentCamera
local lplr = game.Players.LocalPlayer

-- Function to create a new ESP entry
function Library:New(EspName, item, displayText, customizable, highlightSettings, isPlayerStuff)
    customizable = customizable or {
        Font = 3;
        Size = 13;
        TColor = Color3.fromRGB(255,255,255);
        T2Color = Color3.fromRGB(210,210,210);
        TracerThickness = 1;
    }
    
    highlightSettings = highlightSettings or {
        Using = false;
        FillColor = Color3.fromRGB(255,255,255);
        FillTransparency = 0.75;
        OutlineColor = Color3.fromRGB(0,0,0);
    }

    local textLabel = Drawing.new("Text")
    textLabel.Visible = false
    textLabel.Center = true
    textLabel.Outline = true
    textLabel.Font = customizable.Font
    textLabel.Size = customizable.Size
    textLabel.Color = customizable.TColor
    textLabel.Text = displayText

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = customizable.T2Color
    tracer.Thickness = customizable.TracerThickness
    tracer.Transparency = 1
    
    local Highlight

    if highlightSettings.Using then
        local Highlight = Instance.new("Highlight")
        Highlight.Parent = game:GetService("CoreGui")
        Highlight.Adornee = item
        Highlight.FillColor = highlightSettings.FillColor
        Highlight.FillTransparency = highlightSettings.FillTransparency
        Highlight.OutlineColor = highlightSettings.OutlineColor
        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Highlight.Name = EspName
    end

    local update = function()
        local Con
        -- Outside RenderStepped because it would be worse

        if isPlayerStuff ~= nil then
            if isPlayerStuff.IsPlayer then
                game.Players.PlayerRemoving:Connect(function(plr)
                    if plr.Name == isPlayerStuff.PlayerName then
                        Library:Remove(isPlayerStuff.TableName)
                    end
                end)
            end
        end

        Con = game:GetService("RunService").RenderStepped:Connect(function()

            if item then
                local VEC, onScreen = cam:WorldToViewportPoint(item.Position)
                -- Update text and tracer position
                if onScreen then
                    textLabel.Position = Vector2.new(VEC.X, VEC.Y)
                    textLabel.Visible = true

                    tracer.From = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 1)
                    tracer.To = Vector2.new(VEC.X, VEC.Y)
                    tracer.Visible = true

                    -- Update customizable properties
                    textLabel.Font = customizable.Font
                    textLabel.Size = customizable.Size
                    textLabel.Color = customizable.TColor

                    tracer.Color = customizable.T2Color
                    tracer.Thickness = customizable.TracerThickness
                else
                    textLabel.Visible = false
                    tracer.Visible = false
                end
            else
                if item == nil then
                    Con:Disconnect()
                    textLabel:Remove()
                    tracer:Remove()
                end
            end
        end)
    end

    coroutine.wrap(update)()


    table.insert(Library.ESP, {
        Name = EspName;
        TxT = textLabel;
        Tracer = tracer;
        highlight = Highlight;
    })
end

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

return Library
