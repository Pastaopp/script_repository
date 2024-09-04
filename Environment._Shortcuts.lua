local __CHARS, A1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789

-- ready up to see a weird code

function A8(A9)
    local A10 = ""
    local A11 = ""
    local A12 = #A9

    if A12 % 3 == 1 then
        A11 = "=="
        A9 = A9 .. "\0\0"
    elseif A12 % 3 == 2 then
        A11 = "="
        A9 = A9 .. "\0"
    end

    for A13 = 1, A12, 3 do
        local A14 = string.byte(A9, A13)
        local A15 = string.byte(A9, A13 + 1) or 0
        local A16 = string.byte(A9, A13 + 2) or 0

        local A17 = (A14 << 16) + (A15 << 8) + A16
        local A18 = ((A17 >> 18) & 63) + 1
        local A19 = ((A17 >> 12) & 63) + 1
        local A20 = ((A17 >> 6) & 63) + 1
        local A21 = (A17 & 63) + 1

        A10 = A10 .. A1:sub(A18, A18)
                     .. A1:sub(A19, A19)
                     .. A1:sub(A20, A20)
                     .. A1:sub(A21, A21)
    end

    return A10:sub(1, #A10 - #A11) .. A11
end


__ENV = {}
__ENV[1] = {
    ["ToStr"] = tostring,
    ["Call"] = pcall,
    ["Xcall"] = xpcall,
    ["GetServ"] = function(name) return game:GetService(name) end,
    ["game_services"] = {
        ["rep_storage"] = game:GetService("ReplicatedStorage"),
        ["w_space"] = game:GetService("Workspace") or workspace or Workspace,
        ["lighting"] = game:GetService("Lighting"),
        ["Players"] = game:GetService("Players"),
        ["LocalPlayer"] = game:GetService("Players").LocalPlayer,
        ["PlayerCharacter"] = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait(),
        ["PlayerGUI"] = game:GetService("Players").LocalPlayer.PlayerGui or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
    },
    ["Sformat"] = string.format,
    ["_hex"] = function(lng)
        local A1 = ""
        for A2 = 1, lng do
            A1 = A1 .. string.format("%x", math.random(0, 15)):upper()
        end
        return A1
    end,
    ["_hRand"] = function(A0)
        local A1 = ""
        local A2 = "0123456789ABCDEF"
        for A3 = 1, A0 do
            local A4 = math.random(1, #A2)
            A1 = A1 .. A2:sub(A4, A4)
        end
        return A1
    end;
    ["base64_gen"] = A8
}

for k, v in pairs(__ENV[1]) do
    local exploitEnvironment = _G or getgenv
    print(string.format("Debug Environment - Name : %s | Value : %s", k, tostring(v)))
    exploitEnvironment[k] = v
end

for k, v in pairs(__ENV[1]) do
    local a = __ENV[1]["Sformat"]
    print(a("Documentation - - - Name : %s - - - Type : %s - - - Is table : %s - - - Amount of content if is table : %s", k, typeof(v), typeof(v) == 'table' and 'true' or 'false', typeof(v) == 'table' and #v or 'None'))
end
