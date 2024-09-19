assert(getgenv().Webhook, "Webhook url is not defined.")
assert(getgenv().UID, "User ID is not defined")

local LogService = game:GetService("LogService")
local HttpService = game:GetService("HttpService")
local webhookUrl = getgenv().Webhook

-- User ID to ping in Discord
local userIDToPing = getgenv().UID

-- Rate limit settings
local rateLimitInterval = 1  -- Time window in seconds
local maxErrors = 3  -- Maximum number of errors in the time window
local errorTimestamps = {}  -- Table to track error timestamps

-- Function to create a new embed
local function FormNewEmbed(info)
    local newEmbed = {
        ["title"] = info.title,
        ["description"] = info.desc,
        ["fields"] = info.fields,
        ["footer"] = {["text"] = info.footer or "uncomplete"},
        ["color"] = info.color or 16711680  -- Default to red if no color is provided
    }

    return HttpService:JSONEncode({
        ["embeds"] = {newEmbed}
    })
end

-- Function to send the webhook
local function SendNewHook(url, data)
    local success, response = pcall(function()
        return request({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = data
        })
    end)

    if success then
        print("Webhook sent successfully.")
        if type(response) == "table" then
            print("Response table:", response)
        else
            print("Response:", response)
        end
    else
        print("Failed to send webhook.")
        if type(response) == "table" then
            for key, value in pairs(response) do
                print(key, value)
            end
        else
            print("Response:", response)
        end
    end
end

-- Function to handle log messages
local function OnMessage(message, messageType)
    if messageType == Enum.MessageType.MessageError then
        local currentTime = os.time()
        
        -- Clean up old timestamps
        for i = #errorTimestamps, 1, -1 do
            if errorTimestamps[i] < currentTime - rateLimitInterval then
                table.remove(errorTimestamps, i)
            end
        end
        
        -- Check rate limit
        if #errorTimestamps >= maxErrors then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Rate Limit Triggered",
                Text = "Too many errors detected in a short period. Notifications have been rate limited.",
                Duration = 5
            })
            return
        end

        -- Add current error timestamp
        table.insert(errorTimestamps, currentTime)
        
        local errorMessage = tostring(message)

        -- Filter to include only client-side errors (messages containing "[string ")
        if errorMessage:match("%[string ") then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "ErrorTracker",
                Text = "Check the logs, a new error has been detected.",
                Duration = 5
            })
            
            -- Remove "Stack Begin" and "Stack End" lines
            local cleanedErrorMessage = errorMessage:gsub("Stack Begin%s.-Stack End", "")

            -- Extract the script info (one line)
            local scriptInfo = errorMessage:match("Script '%[.-%]', Line %d+$") or "No script info"

            local formattedDate = os.date("%Y-%m-%d %H:%M:%S", currentTime)
            local dayOfWeek = os.date("%A", currentTime)

            local newEmbed = FormNewEmbed({
                ["title"] = "Error Detected!",
                ["desc"] = "ErrorTracker has detected a new client-side error.\n\n<@" .. userIDToPing .. ">",
                ["fields"] = {
                    {
                        ["name"] = "Error Message",
                        ["value"] = "\n" .. cleanedErrorMessage,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "User ID",
                        ["value"] = tostring(game.Players.LocalPlayer.UserId),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Time",
                        ["value"] = os.date("%H:%M:%S", currentTime),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Date of Error",
                        ["value"] = formattedDate .. "\n\n" .. dayOfWeek,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Place Name [according to PlaceId]",
                        ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Script Info",
                        ["value"] = scriptInfo,
                        ["inline"] = true
                    }
                },
                ["footer"] = "ErrorTracker",
                ["color"] = 16711680  -- Red color
            })

            SendNewHook(webhookUrl, newEmbed)
        end
    end
end

-- Connect the function to the MessageOut event
LogService.MessageOut:Connect(OnMessage)
