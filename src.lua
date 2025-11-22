-- ULTRA PREMIUM DARKGREY UI | Fixed Sizes + Fancy Animations | 2025
-- Load: loadstring(game:HttpGet("https://raw.githubusercontent.com/0xFEE1DEAD/DarkGrey/main/Main.lua"))()

local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer

local Theme = {
    Bg = Color3.fromRGB(15,15,15),
    Top = Color3.fromRGB(22,22,22),
    Side = Color3.fromRGB(30,30,30),
    Main = Color3.fromRGB(38,38,38),
    Text = Color3.fromRGB(240,240,240),
    Accent = Color3.fromRGB(100,149,237),
    Hover = Color3.fromRGB(55,55,55),
    Success = Color3.fromRGB(0,170,140)
}

local Lucide = {
    home = "Home", zap = "Zap", eye = "Eye", activity = "Activity", settings = "Settings", user = "User", sword = "Sword", shield = "Shield"
}

function Library:Notify(t) 
    spawn(function()
        local n = Instance.new("Frame")
        n.Size = UDim2.new(0,380,0,90)
        n.Position = UDim2.new(1,-400,1,-100)
        n.BackgroundColor3 = Theme.Main
        n.Parent = CoreGui
        local c = Instance.new("UICorner",n); c.CornerRadius = UDim.new(0,14)
        local s = Instance.new("UIStroke",n); s.Color = Theme.Accent; s.Thickness = 2

        local title = Instance.new("TextLabel",n)
        title.Text = t.Title or "Notification"
        title.Size = UDim2.new(1,-30,0,30)
        title.Position = UDim2.new(0,15,0,10)
        title.BackgroundTransparency = 1
        title.TextColor3 = Theme.Text
        title.Font = Enum.Font.GothamBold
        title.TextSize = 18
        title.TextXAlignment = "Left"

        local desc = Instance.new("TextLabel",n)
        desc.Text = t.Content or ""
        desc.Size = UDim2.new(1,-30,0,30)
        desc.Position = UDim2.new(0,15,0,40)
        desc.BackgroundTransparency = 1
        desc.TextColor3 = Color3.fromRGB(180,180,180)
        desc.Font = Enum.Font.Gotham
        desc.TextSize = 14
        desc.TextXAlignment = "Left"

        TweenService:Create(n,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Position=UDim2.new(1,-20,1,-100)}):Play()
        task.wait(t.Duration or 4)
        TweenService:Create(n,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Position=UDim2.new(1,-400,1,-100)}):Play()
        task.wait(0.5); n:Destroy()
    end)
end

function Library:CreateWindow(cfg)
    cfg = cfg or {}
    local win = {}
    local title = cfg.Title or "DarkGrey"
    local sub = cfg.SubTitle or "Premium"
    local key = cfg.MinimizeKey or Enum.KeyCode.RightControl

    local scr = Instance.new("ScreenGui")
    scr.ResetOnSpawn = false
    scr.Parent = CoreGui

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0,720,0,540)
    main.Position = UDim2.new(0.5,-360,0.5,-270)
    main.BackgroundColor3 = Theme.Bg
    main.ClipsDescendants = true
    main.Parent = scr
    local mc = Instance.new("UICorner",main); mc.CornerRadius = UDim.new(0,16)
    local ms = Instance.new("UIStroke",main); ms.Color = Theme.Accent; ms.Thickness = 2.5

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1,0,0,60)
    top.BackgroundColor3 = Theme.Top
    top.Parent = main
    local tc = Instance.new("UICorner",top); tc.CornerRadius = UDim.new(0,16)

    local ttitle = Instance.new("TextLabel",top)
    ttitle.Text = title
    ttitle.Size = UDim2.new(0,400,0,35)
    ttitle.Position = UDim2.new(0,25,0,8)
    ttitle.BackgroundTransparency = 1
    ttitle.TextColor3 = Theme.Text
    ttitle.Font = Enum.Font.GothamBlack
    ttitle.TextSize = 22
    ttitle.TextXAlignment = "Left"

    local tsub = Instance.new("TextLabel",top)
    tsub.Text = sub
    tsub.Size = UDim2.new(0,400,0,20)
    tsub.Position = UDim2.new(0,27,0,35)
    tsub.BackgroundTransparency = 1
    tsub.TextColor3 = Color3.fromRGB(160,160,160)
    tsub.Font = Enum.Font.Gotham
    tsub.TextSize = 14
    tsub.TextXAlignment = "Left"

    local close = Instance.new("TextButton",top)
    close.Size = UDim2.new(0,40,0,40)
    close.Position = UDim2.new(1,-55,0.5,-20)
    close.BackgroundColor3 = Color3.fromRGB(220,50,50)
    close.Text = "Close"
    close.TextColor3 = Color3.new(1,1,1)
    close.Font = Enum.Font.GothamBold
    close.TextSize = 20
    local cc = Instance.new("UICorner",close); cc.CornerRadius = UDim.new(0,12)
    close.MouseButton1Click:Connect(function() scr:Destroy() end)

    -- Dragging
    local dragging = false
    top.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local delta = i.Position - main.Position
            local conn; conn = i.Changed:Connect(function()
                if i.UserInputState == Enum.UserInputState.End then dragging = false; conn:Disconnect() end
            end)
            UserInputService.InputChanged:Connect(function(i2)
                if dragging and i2.UserInputType == Enum.UserInputType.MouseMovement then
                    main.Position = i2.Position - delta
                end
            end)
        end
    end)

    local tabsFrame = Instance.new("Frame")
    tabsFrame.Size = UDim2.new(0,180,1,-60)
    tabsFrame.Position = UDim2.new(0,0,0,60)
    tabsFrame.BackgroundColor3 = Theme.Side
    tabsFrame.Parent = main

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1,-180,1,-60)
    contentFrame.Position = UDim2.new(0,180,0,60)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = main

    local currentTab = nil

    function win:AddTab(tabcfg)
        local tab = {}
        local name = tabcfg.Title or "Tab"
        local icon = tabcfg.Icon and Lucide[tabcfg.Icon] or "Home"

        local tabBtn = Instance.new("TextButton")
        tabBtn.Size = UDim2.new(1,-20,0,55)
        tabBtn.Position = UDim2.new(0,10,0,#tabsFrame:GetChildren()*60)
        tabBtn.BackgroundColor3 = Theme.Main
        tabBtn.Text = "  "..icon.."  "..name
        tabBtn.TextColor3 = Theme.Text
        tabBtn.Font = Enum.Font.GothamBold
        tabBtn.TextSize = 16
        tabBtn.TextXAlignment = "Left"
        tabBtn.Parent = tabsFrame
        local bc = Instance.new("UICorner",tabBtn); bc.CornerRadius = UDim.new(0,12)

        local indicator = Instance.new("Frame",tabBtn)
        indicator.Size = UDim2.new(0,5,1,0)
        indicator.BackgroundColor3 = Theme.Accent
        indicator.BackgroundTransparency = 1

        local container = Instance.new("ScrollingFrame")
        container.Size = UDim2.new(1,-30,1,-20)
        container.Position = UDim2.new(0,15,0,10)
        container.BackgroundTransparency = 1
        container.ScrollBarThickness = 4
        container.AutomaticCanvasSize = Enum.AutomaticSize.Y
        container.Visible = false
        container.Parent = contentFrame
        local layout = Instance.new("UIListLayout",container)
        layout.Padding = UDim.new(0,12)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        local pad = Instance.new("UIPadding",container)
        pad.PaddingTop = UDim.new(0,10)

        tabBtn.MouseButton1Click:Connect(function()
            if currentTab then currentTab.Visible = false end
            container.Visible = true
            currentTab = container
            for _,b in pairs(tabsFrame:GetChildren()) do
                if b:IsA("TextButton") then
                    TweenService:Create(b:FindFirstChildOfClass("Frame"),TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
                end
            end
            TweenService:Create(indicator,TweenInfo.new(0.3),{BackgroundTransparency=0}):Play()
        end)

        if not currentTab then
            container.Visible = true
            currentTab = container
            indicator.BackgroundTransparency = 0
        end

        function tab:AddButton(d)
            if d.Type == "Toggle" then
                local tog = Instance.new("Frame")
                tog.Size = UDim2.new(1,0,0,50)
                tog.BackgroundColor3 = Theme.Main
                tog.Parent = container
                local tc = Instance.new("UICorner",tog); tc.CornerRadius = UDim.new(0,14)

                local lbl = Instance.new("TextLabel",tog)
                lbl.Text = d.Title or "Toggle"
                lbl.Size = UDim2.new(1,-80,1,0)
                lbl.BackgroundTransparency = 1
                lbl.TextColor3 = Theme.Text
                lbl.Font = Enum.Font.GothamBold
                lbl.TextSize = 16
                lbl.TextXAlignment = "Left"
                lbl.Position = UDim2.new(0,20,0,0)

                local switch = Instance.new("Frame",tog)
                switch.Size = UDim2.new(0,60,0,30)
                switch.Position = UDim2.new(1,-80,0.5,-15)
                switch.BackgroundColor3 = d.Default and Theme.Success or Color3.fromRGB(70,70,70)
                local sc = Instance.new("UICorner",switch); sc.CornerRadius = UDim.new(1,0)

                local circle = Instance.new("Frame",switch)
                circle.Size = UDim2.new(0,24,0,24)
                circle.Position = d.Default and UDim2.new(1,-28,0.5,-12) or UDim2.new(0,4,0.5,-12)
                circle.BackgroundColor3 = Color3.new(1,1,1)
                local cc = Instance.new("UICorner",circle); cc.CornerRadius = UDim.new(1,0)

                local val = d.Default or false
                tog.InputBegan:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                        val = not val
                        TweenService:Create(switch,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{BackgroundColor3 = val and Theme.Success or Color3.fromRGB(70,70,70)}):Play()
                        TweenService:Create(circle,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{Position = val and UDim2.new(1,-28,0.5,-12) or UDim2.new(0,4,0.5,-12)}):Play()
                        if d.Callback then d.Callback(val) end
                    end
                end)

            elseif d.Type == "Button" then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1,0,0,50)
                btn.BackgroundColor3 = Theme.Main
                btn.Text = d.Title or "Button"
                btn.TextColor3 = Theme.Text
                btn.Font = Enum.Font.GothamBold
                btn.TextSize = 17
                btn.Parent = container
                local bc = Instance.new("UICorner",btn); bc.CornerRadius = UDim.new(0,14)
                btn.MouseButton1Click:Connect(d.Callback or function() end)
                btn.MouseEnter:Connect(function() TweenService:Create(btn,TweenInfo.new(0.2),{BackgroundColor3=Theme.Hover}):Play() end)
                btn.MouseLeave:Connect(function() TweenService:Create(btn,TweenInfo.new(0.2),{BackgroundColor3=Theme.Main}):Play() end)

            elseif d.Type == "Slider" then
                local s = Instance.new("Frame")
                s.Size = UDim2.new(1,0,0,70)
                s.BackgroundColor3 = Theme.Main
                s.Parent = container
                local sc = Instance.new("UICorner",s); sc.CornerRadius = UDim.new(0,14)

                local title = Instance.new("TextLabel",s)
                title.Text = d.Title or "Slider"
                title.Size = UDim2.new(1,-100,0,25)
                title.Position = UDim2.new(0,20,0,8)
                title.BackgroundTransparency = 1
                title.TextColor3 = Theme.Text
                title.Font = Enum.Font.GothamBold
                title.TextSize = 16
                title.TextXAlignment = "Left"

                local val = Instance.new("TextLabel",s)
                val.Text = tostring(d.Default)
                val.Size = UDim2.new(0,80,0,25)
                val.Position = UDim2.new(1,-100,0,8)
                val.BackgroundTransparency = 1
                val.TextColor3 = Theme.Accent
                val.Font = Enum.Font.GothamBold

                local track = Instance.new("Frame",s)
                track.Size = UDim2.new(1,-40,0,10)
                track.Position = UDim2.new(0,20,0,45)
                track.BackgroundColor3 = Color3.fromRGB(60,60,60)
                local tc = Instance.new("UICorner",track); tc.CornerRadius = UDim.new(0,5)

                local fill = Instance.new("Frame",track)
                fill.Size = UDim2.new((d.Default-d.Min)/(d.Max-d.Min),0,1,0)
                fill.BackgroundColor3 = Theme.Accent
                local fc = Instance.new("UICorner",fill); fc.CornerRadius = UDim.new(0,5)

                local knob = Instance.new("Frame",fill)
                knob.Size = UDim2.new(0,24,0,24)
                knob.Position = UDim2.new(1,-12,-1, -7)
                knob.BackgroundColor3 = Theme.Text
                local kc = Instance.new("UICorner",knob); kc.CornerRadius = UDim.new(1,0)

                local dragging = false
                track.InputBegan:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true end
                end)
                UserInputService.InputEnded:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end
                end)
                UserInputService.InputChanged:Connect(function(i)
                    if dragging then
                        local rel = math.clamp((i.Position.X - track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
                        local value = d.Min + rel * (d.Max - d.Min)
                        fill.Size = UDim2.new(rel,0,1,0)
                        val.Text = tostring(math.floor(value+0.5))
                        if d.Callback then d.Callback(value) end
                    end
                end)
            end
        end

        return tab
    end

    return win
end

return Library
