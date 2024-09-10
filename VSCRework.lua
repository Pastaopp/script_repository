-- Creds to uhhh nitrog0d ROBLOXConnect repo
-- this is just a tiny different version that prints some stuff AND prevents errors from being printed into console

if not game:IsLoaded() then
  game.Loaded:Wait()
end

print("I <3 nitrog0d\nWow,Wow-Wow-Wow,Wow");

local HttpService = game:GetService("HttpService")
local WebSocketInstance = nil

game:GetService("LogService").MessageOut:Connect(function(message, messageType)
  if WebSocketInstance then
    WebSocketInstance:Send(HttpService:JSONEncode({
      type = "log",
      data = {
        message = message,
        type = messageType.Value
      }
    }))
  end
end)

game:GetService("ScriptContext").ErrorDetailed:Connect(function(message, stackTrace, script, details, securityLevel)
  if WebSocketInstance then
    WebSocketInstance:Send(HttpService:JSONEncode({
      type = "detailed_error",
      data = {
        message = message,
        stackTrace = stackTrace,
        details = details,
        securityLevel = securityLevel,
      }
    }))
  end
end)

task.spawn(function()
  while task.wait(1) do
    local preventother, preventother1 = pcall(function()
      WebSocketInstance = ((syn and syn.websocket) or WebSocket).connect("ws://localhost:42121")

      local localPlayer = game:GetService("Players").LocalPlayer
      -- this sending works correctly, but errors sometimes for some reason
      local prevent, prevent2 = pcall(function()
          WebSocketInstance:Send(HttpService:JSONEncode({
            type = "connect",
            data = {
              displayName = localPlayer.DisplayName,
              name = localPlayer.Name
            }
          }))
      end)

      -- another error
      local preventErrs, preventErrs2 = pcall(function()
          print("--------------------------------------------------------- Wow i just prevented once again, another useless error.")
          WebSocketInstance.OnMessage:Connect(function(msg)
            local json = HttpService:JSONDecode(msg)
            if json.type == "run_luas" then
              for _, lua in pairs(json.data.luas) do
                loadstring(lua)()
              end
            end
          end)
      end)

      WebSocketInstance.OnClose:Wait()
      WebSocketInstance = nil
    end)
  end
end)
