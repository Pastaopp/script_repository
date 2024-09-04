return pcall(function()
  __ENV={}; __ENV[1]={
      ["ToStr"] = tostring; ["Call"]=pcall;["Xcall"]=xpcall;["GetServ"]=function(name) return game:GetService(name) end;["game_services"]={
        ["rep_storage"] = game:GetService"ReplicatedStorage";
        ["w_space"] = game:GetService"Workspace" or workspace or Workspace;
        ["lighting"] = game:GetService"Lighting";
        ["Players"] = game:GetService"Players";
        ["LocalPlayer"] = game:GetService("Players").LocalPlayer;
        ["PlayerCharacter"] = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait();
        ["PlayerGUI"] = game:GetService("Players").LocalPlayer.PlayerGui or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
      }
    }

  for k,v in ipairs(__ENV[1]) do
      local exploitEnvironment = _G or getgenv or pcall(function() return warn("_G or getgenv not found.") end)
      print(string.format("Debug Environment - Name : %s | Value : %s", k, v))
      exploitEnvironment[k] = v
    end
end)
