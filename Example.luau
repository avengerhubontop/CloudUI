loadstring(game:HttpGet("https://files.catbox.moe/2r1n7q.lua"))()

local Library = loadstring(game:HttpGet("https://files.catbox.moe/2r1n7q.lua"))()
local Window = Library:CreateWindow({Title="DarkGrey Premium",SubTitle="by king",MinimizeKey=Enum.KeyCode.RightControl})

local Main = Window:AddTab({Title="Combat",Icon="zap"})
local Movement = Window:AddTab({Title="Movement",Icon="activity"})
local Visual = Window:AddTab({Title="Visual",Icon="eye"})
local Misc = Window:AddTab({Title="Misc",Icon="settings"})

local ESPEnabled = false
local AimbotEnabled = false
local FlyEnabled = false
local FlySpeed = 100
local TPEnabled = false

local function GetClosestPlayer()
    local closest, dist = nil, math.huge
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
            local mag = (plr.Character.Head.Position - game.Players.LocalPlayer.Character.Head.Position).Magnitude
            if mag < dist then dist = mag closest = plr end
        end
    end
    return closest
end

Main:AddToggle({Title="Aimbot",Default=false,Callback=function(v)
    AimbotEnabled = v
    spawn(function()
        while AimbotEnabled do
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                local target = GetClosestPlayer()
                if target and target.Character and target.Character:FindFirstChild("Head") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, target.Character.Head.Position)
                    mouse1click()
                end
            end
            task.wait()
        end
    end)
end})

Main:AddSlider({Title="Aimbot FOV",Min=10,Max=180,Default=60,Callback=function() end})

Visual:AddToggle({Title="ESP",Default=false,Callback=function(v)
    ESPEnabled = v
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= game.Players.LocalPlayer and plr.Character then
            local highlight = plr.Character:FindFirstChild("ESPHighlight") or Instance.new("Highlight", plr.Character)
            highlight.Name = "ESPHighlight"
            highlight.FillColor = Color3.fromRGB(255,0,100)
            highlight.OutlineColor = Color3.fromRGB(255,255,255)
            highlight.Enabled = ESPEnabled
        end
    end
    game.Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function(char)
            task.wait(1)
            if ESPEnabled then
                local hl = Instance.new("Highlight", char)
                hl.Name = "ESPHighlight"
                hl.FillColor = Color3.fromRGB(255,0,100)
                hl.OutlineColor = Color3.fromRGB(255,255,255)
            end
        end)
    end)
end})

Movement:AddToggle({Title="Fly",Default=false,Callback=function(v)
    FlyEnabled = v
    if v then
        local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        bv.Velocity = Vector3.new(0,0,0)
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        spawn(function()
            while FlyEnabled and game.Players.LocalPlayer.Character do
                local cam = workspace.CurrentCamera.CFrame
                local move = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cam.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cam.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cam.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cam.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
                bv.Velocity = move.Unit * FlySpeed
                task.wait()
            end
            bv:Destroy()
        end)
    end
end})

Movement:AddSlider({Title="Fly Speed",Min=50,Max=500,Default=100,Callback=function(v) FlySpeed = v end})

Misc:AddButton({Title="Teleport to Random Player",Callback=function()
    local plrs = {}
    for _, p in ipairs(game.Players:GetPlayers()) do if p ~= game.Players.LocalPlayer then table.insert(plrs, p) end end
    if #plrs > 0 then
        local target = plrs[math.random(1,#plrs)]
        if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
        end
    end
end})

Misc:AddToggle({Title="NoClip",Default=false,Callback=function(v)
    spawn(function()
        while v do
            for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            task.wait()
        end
    end)
end})

Library:Notify({Title="Loaded",Content="DarkGrey Premium ready",Duration=4})
