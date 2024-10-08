warn("Checking")
assert(getgenv().Webhook, "Webhook URL is not defined.")
assert(getgenv().UID, "User ID is not defined")

local LogService = game:GetService("LogService")
local HttpService = game:GetService("HttpService")
local webhookUrl = getgenv().Webhook

local userIDToPing = getgenv().UID

local rateLimitInterval = 1
local maxErrors = 3
local errorTimestamps = {}

local function FormNewEmbed(info)
    local newEmbed = {
        ["title"] = info.title,
        ["description"] = info.desc,
        ["fields"] = info.fields,
        ["footer"] = {["text"] = info.footer or "uncomplete"},
        ["color"] = info.color or 16711680
    }

    return HttpService:JSONEncode({
        ["embeds"] = {newEmbed}
    })
end

local function SendNewHook(url, data)
    pcall(function()
        request({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = data
        })
    end)
end

local function OnMessage(message, messageType)
    if messageType == Enum.MessageType.MessageError then
        local currentTime = os.time()

        for i = #errorTimestamps, 1, -1 do
            if errorTimestamps[i] < currentTime - rateLimitInterval then
                table.remove(errorTimestamps, i)
            end
        end

        if #errorTtimestamps >= maxErrors then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Rate Limit Triggered",
                Text = "Too many errors detected in a short period. Notifications have been rate limited.",
                Duration = 5
            })
            return
        end

        table.insert(errorTimestamps, currentTime)

        local errorMessage = tostring(message)

        if errorMessage:match("%[string ") then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "ErrorTracker",
                Text = "Check the logs, a new error has been detected.",
                Duration = 5
            })

            local cleanedErrorMessage = errorMessage:gsub("Stack Begin%s.-Stack End", "")
            local scriptInfo = errorMessage:match("Script '%[.-%]', Line %d+$") or "No script info"

            local formattedDate = os.date("%Y-%m-%d %H:%M:%S", currentTime)
            local dayOfWeek = os.date("%A", currentTime)

            local player = game.Players.LocalPlayer
            local newEmbed = FormNewEmbed({
                ["title"] = "Error Detected!",
                ["desc"] = "ErrorTracker has detected a new client-side error.",
                ["fields"] = {
                    {
                        ["name"] = "Error Message",
                        ["value"] = "\n" .. cleanedErrorMessage,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "User ID",
                        ["value"] = tostring(player.UserId),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Name",
                        ["value"] = player.Name,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Display Name",
                        ["value"] = player.DisplayName,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Account Age",
                        ["value"] = tostring(player.AccountAge) .. " days",
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
                ["color"] = 16711680
            })

            local pingMessage = HttpService:JSONEncode({
                content = "<@" .. userIDToPing .. "> A new error has been detected."
            })

            SendNewHook(webhookUrl, pingMessage)
            SendNewHook(webhookUrl, newEmbed)
        end
    end
end

LogService.MessageOut:Connect(OnMessage)
