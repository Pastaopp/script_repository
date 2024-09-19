assert(getgenv().l__Webhook__l, "Webhook url is not defined.")
assert(getgenv().A12, "User ID is not defined")

local l__LogService__l = game:GetService("LogService")
local l__HttpService__l = game:GetService("HttpService")
local A5 = getgenv().l__Webhook__l

local A24 = getgenv().A12

local l__rateLimitInterval__l = 1
local l__maxErrors__l = 3
local l__errorTimestamps__l = {}

local function l__FormNewEmbed__l(l__info__l)
    local l__newEmbed__l = {
        ["title"] = l__info__l.title,
        ["description"] = l__info__l.desc,
        ["fields"] = l__info__l.fields,
        ["footer"] = {["text"] = l__info__l.footer or "uncomplete"},
        ["color"] = l__info__l.color or 16711680
    }

    return l__HttpService__l:JSONEncode({
        ["embeds"] = {l__newEmbed__l}
    })
end

local function l__SendNewHook__l(l__url__l, l__data__l)
    local l__success__l, l__response__l = pcall(function()
        return request({
            Url = l__url__l,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = l__data__l
        })
    end)

    if l__success__l then
        print("Webhook sent successfully.")
        if type(l__response__l) == "table" then
            print("Response table:", l__response__l)
        else
            print("Response:", l__response__l)
        end
    else
        print("Failed to send webhook.")
        if type(l__response__l) == "table" then
            for l__key__l, l__value__l in pairs(l__response__l) do
                print(l__key__l, l__value__l)
            end
        else
            print("Response:", l__response__l)
        end
    end
end

local function l__OnMessage__l(l__message__l, l__messageType__l)
    if l__messageType__l == Enum.MessageType.MessageError then
        local l__currentTime__l = os.time()

        for l__i__l = #l__errorTimestamps__l, 1, -1 do
            if l__errorTimestamps__l[l__i__l] < l__currentTime__l - l__rateLimitInterval__l then
                table.remove(l__errorTimestamps__l, l__i__l)
            end
        end

        if #l__errorTimestamps__l >= l__maxErrors__l then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Rate Limit Triggered",
                Text = "Too many errors detected in a short period. Notifications have been rate limited.",
                Duration = 5
            })
            return
        end

        table.insert(l__errorTimestamps__l, l__currentTime__l)

        local l__errorMessage__l = tostring(l__message__l)

        if l__errorMessage__l:match("%[string ") then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "ErrorTracker",
                Text = "Check the logs, a new error has been detected.",
                Duration = 5
            })
            
            local l__cleanedErrorMessage__l = l__errorMessage__l:gsub("Stack Begin%s.-Stack End", "")

            local l__scriptInfo__l = l__errorMessage__l:match("Script '%[.-%]', Line %d+$") or "No script info"

            local l__formattedDate__l = os.date("%Y-%m-%d %H:%M:%S", l__currentTime__l)
            local l__dayOfWeek__l = os.date("%A", l__currentTime__l)

            local l__newEmbed__l = l__FormNewEmbed__l({
                ["title"] = "Error Detected!",
                ["desc"] = "ErrorTracker has detected a new client-side error.\n\n<@" .. l__A24__l .. ">",
                ["fields"] = {
                    {
                        ["name"] = "Error Message",
                        ["value"] = "\n" .. l__cleanedErrorMessage__l,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "User ID",
                        ["value"] = tostring(game.Players.LocalPlayer.UserId),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Time",
                        ["value"] = os.date("%H:%M:%S", l__currentTime__l),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Date of Error",
                        ["value"] = l__formattedDate__l .. "\n\n" .. l__dayOfWeek__l,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Place Name [according to PlaceId]",
                        ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Script Info",
                        ["value"] = l__scriptInfo__l,
                        ["inline"] = true
                    }
                },
                ["footer"] = "ErrorTracker",
                ["color"] = 16711680
            })

            l__SendNewHook__l(A5, l__newEmbed__l)
        end
    end
end

l__LogService__l.MessageOut:Connect(l__OnMessage__l)
