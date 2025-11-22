-- DARKGREY UI LIBRARY | GOD TIER 2025 | FINAL PERFECTION
-- EVERYTHING FIXED, ANIMATED, AND BEAUTIFUL
-- loadstring(game:HttpGet("YOUR_GITHUB_LINK_HERE"))()

local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer

local Theme = {
    Bg = Color3.fromRGB(16,16,16),
    Top = Color3.fromRGB(24,24,24),
    Side = Color3.fromRGB(32,32,32),
    Main = Color3.fromRGB(42,42,42),
    Text = Color3.fromRGB(250,250,250),
    Accent = Color3.fromRGB(100,180,255),
    Hover = Color3.fromRGB(65,65,65),
    Success = Color3.fromRGB(0,200,150)
}

local Icons = {
    close = "×", minimize = "−", maximize = "□", home = "Home", zap = "Zap", eye = "Eye", sword = "Sword", activity = "Activity", settings = "Settings"
}

function Library:Notify(d)
    spawn(function()
        local n = Instance.new("Frame")
        n.Size = UDim2.new(0,380,0,95)
        n.Position = UDim2.new(1,-400,1,-110)
        n.BackgroundColor3 = Theme.Main
        n.Parent = CoreGui
        local c = Instance.new("UICorner",n); c.CornerRadius = UDim.new(0,16)
        local s = Instance.new("UIStroke",n); s.Color = Theme.Accent; s.Thickness = 2

        local t = Instance.new("TextLabel",n)
        t.Text = d.Title or "DarkGrey"
        t.Size = UDim2.new(1,-30,0,36)
        t.Position = UDim2.new(0,20,0,12)
        t.BackgroundTransparency = 1
        t.TextColor3 = Theme.Text
        t.Font = Enum.Font.GothamBold
        t.TextSize = 19
        t.TextXAlignment = "Left"

        local dsc = Instance.new("TextLabel",n)
        dsc.Text = d.Content or "Loaded"
        dsc.Size = UDim2.new(1,-30,0,30)
        dsc.Position = UDim2.new(0,20,0,50)
        dsc.BackgroundTransparency = 1
        dsc.TextColor3 = Color3.fromRGB(180,180,180)
        dsc.Font = Enum.Font.Gotham
        dsc.TextSize = 15
        dsc.TextXAlignment = "Left"

        n.BackgroundTransparency = 1
        TweenService:Create(n,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{BackgroundTransparency = 0, Position = UDim2.new(1,-20,1,-110)}):Play()
        task.wait(d.Duration or 4)
        TweenService:Create(n,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Position = UDim2.new(1,-400,1,-110)}):Play()
        task.wait(0.5); n:Destroy()
    end)
end

function Library:CreateWindow(cfg)
    local Window = {}
    local Title = cfg.Title or "DarkGrey"
    local SubTitle = cfg.SubTitle or "Premium"
    local Size = cfg.Size or UDim2.new(0,640,0,520)
    local Key = cfg.MinimizeKey or Enum.KeyCode.RightControl

    local Gui = Instance.new("ScreenGui")
    Gui.ResetOnSpawn = false
    Gui.Parent = CoreGui

    local Main = Instance.new("Frame")
    Main.Size = Size
    Main.Position = UDim2.new(0.5,-Size.X.Offset/2,0.5,-Size.Y.Offset/2)
    Main.BackgroundColor3 = Theme.Bg
    Main.ClipsDescendants = true
    Main.Parent = Gui
    Main.BackgroundTransparency = 1
    Main.Size = UDim2.new(0,0,0,0)
    local mc = Instance.new("UICorner",Main); mc.CornerRadius = UDim.new(0,18)
    local ms = Instance.new("UIStroke",Main); ms.Color = Theme.Accent; ms.Thickness = 2.5

    local Topbar = Instance.new("Frame")
    Topbar.Size = UDim2.new(1,0,0,60)
    Topbar.BackgroundColor3 = Theme.Top
    Topbar.Parent = Main
    local tc = Instance.new("UICorner",Topbar); tc.CornerRadius = UDim.new(0,18)

    local TitleLabel = Instance.new("TextLabel",Topbar)
    TitleLabel.Text = Title
    TitleLabel.Size = UDim2.new(0,300,0,32)
    TitleLabel.Position = UDim2.new(0,24,0,6)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.Font = Enum.Font.GothamBlack
    TitleLabel.TextSize = 20
    TitleLabel.TextXAlignment = "Left"

    local SubLabel = Instance.new("TextLabel",Topbar)
    SubLabel.Text = SubTitle
    SubLabel.Size = UDim2.new(0,300,0,20)
    SubLabel.Position = UDim2.new(0,26,0,34)
    SubLabel.BackgroundTransparency = 1
    SubLabel.TextColor3 = Color3.fromRGB(150,150,150)
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.TextSize = 13
    SubLabel.TextXAlignment = "Left"

    local Close = Instance.new("TextButton",Topbar)
    Close.Size = UDim2.new(0,46,0,46)
    Close.Position = UDim2.new(1,-56,0.5,-23)
    Close.BackgroundColor3 = Color3.fromRGB(220,50,50)
    Close.Text = Icons.close
    Close.TextColor3 = Color3.new(1,1,1)
    Close.Font = Enum.Font.GothamBold
    Close.TextSize = 28
    local cc = Instance.new("UICorner",Close); cc.CornerRadius = UDim.new(0,14)
    Close.MouseButton1Click:Connect(function() Gui:Destroy() end)

    local Maximize = Instance.new("TextButton",Topbar)
    Maximize.Size = UDim2.new(0,46,0,46)
    Maximize.Position = UDim2.new(1,-108,0.5,-23)
    Maximize.BackgroundColor3 = Theme.Hover
    Maximize.Text = Icons.maximize
    Maximize.TextColor3 = Theme.Text
    Maximize.Font = Enum.Font.GothamBold
    Maximize.TextSize = 20
    local mc2 = Instance.new("UICorner",Maximize); mc2.CornerRadius = UDim.new(0,14)

    local Minimize = Instance.new("TextButton",Topbar)
    Minimize.Size = UDim2.new(0,46,0,46)
    Minimize.Position = UDim2.new(1,-160,0.5,-23)
    Minimize.BackgroundColor3 = Theme.Hover
    Minimize.Text = Icons.minimize
    Minimize.TextColor3 = Theme.Text
    Minimize.Font = Enum.Font.GothamBold
    Minimize.TextSize = 32
    local mic = Instance.new("UICorner",Minimize); mic.CornerRadius = UDim.new(0,14)

    for _,b in {Close,Maximize,Minimize} do
        b.MouseEnter:Connect(function() TweenService:Create(b,TweenInfo.new(0.2),{BackgroundColor3 = b==Close and Color3.fromRGB(255,70,70) or Theme.Accent}):Play() end)
        b.MouseLeave:Connect(function() TweenService:Create(b,TweenInfo.new(0.2),{BackgroundColor3 = b==Close and Color3.fromRGB(220,50,50) or Theme.Hover}):Play() end)
    end

    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0,180,1,-60)
    Sidebar.Position = UDim2.new(0,0,0,60)
    Sidebar.BackgroundColor3 = Theme.Side
    Sidebar.Parent = Main

    local Content = Instance.new("Frame")
    Content.Size = UDim2.new(1,-180,1,-60)
    Content.Position = UDim2.new(0,180,0,60)
    Content.BackgroundTransparency = 1
    Content.Parent = Main

    local CurrentContainer = nil
    local Minimized = false
    local OriginalSize = Main.Size

    Minimize.MouseButton1Click:Connect(function()
        Minimized = not Minimized
        TweenService:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{Size = Minimized and UDim2.new(0,OriginalSize.X.Offset,0,60) or OriginalSize}):Play()
    end)

    Maximize.MouseButton1Click:Connect(function()
        if Main.Size == UDim2.new(1,-40,1,-40) then
            Main.Size = OriginalSize
            Main.Position = UDim2.new(0.5,-OriginalSize.X.Offset/2,0.5,-OriginalSize.Y.Offset/2)
        else
            OriginalSize = Main.Size
            Main.Size = UDim2.new(1,-40,1,-40)
            Main.Position = UDim2.new(0,20,0,20)
        end
    end)

    UserInputService.InputBegan:Connect(function(i,gp)
        if not gp and i.KeyCode == Key then Minimize.MouseButton1Click:Fire() end
    end)

    -- PERFECT DRAGGING (NO SCROLL ISSUE)
    local dragging = false
    local dragStart, startPos
    Topbar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = i.Position
            startPos = Main.Position
        end
    end)
    Topbar.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local delta = i.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- LOAD-IN ANIMATION
    TweenService:Create(Main,TweenInfo.new(0.6,Enum.EasingStyle.Quint),{BackgroundTransparency = 0, Size = Size}):Play()
    TweenService:Create(Main,TweenInfo.new(0.5,Enum.EasingStyle.Back),{Position = UDim2.new(0.5,-Size.X.Offset/2,0.5,-Size.Y.Offset/2)}):Play()

    function Window:AddTab(tabcfg)
        local Tab = {}
        local name = tabcfg.Title or "Tab"
        local icon = tabcfg.Icon or "home"

        local TabBtn = Instance.new("TextButton")
        TabBtn.Size = UDim2.new(1,-20,0,50)
        TabBtn.Position = UDim2.new(0,10,0,10+#Sidebar:GetChildren()*60)
        TabBtn.BackgroundColor3 = Theme.Main
        TabBtn.Text = "  "..icon.."  "..name
        TabBtn.TextColor3 = Theme.Text
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.TextSize = 16
        TabBtn.TextXAlignment = "Left"
        TabBtn.Parent = Sidebar
        local bc = Instance.new("UICorner",TabBtn); bc.CornerRadius = UDim.new(0,14)

        local Indicator = Instance.new("Frame",TabBtn)
        Indicator.Size = UDim2.new(0,5,1,0)
        Indicator.BackgroundColor3 = Theme.Accent
        Indicator.BackgroundTransparency = 1

        local Container = Instance.new("ScrollingFrame")
        Container.Size = UDim2.new(1,-30,1,-20)
        Container.Position = UDim2.new(0,15,0,10)
        Container.BackgroundTransparency = 1
        Container.ScrollBarThickness = 4
        Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Container.ScrollingDirection = Enum.ScrollingDirection.Y
        Container.Visible = false
        Container.Parent = Content
        Container.CanvasSize = UDim2.new(0,0,0,0)
        local layout = Instance.new("UIListLayout",Container)
        layout.Padding = UDim.new(0,12)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        local pad = Instance.new("UIPadding",Container)
        pad.PaddingTop = UDim.new(0,12)
        pad.PaddingLeft = UDim.new(0,8)
        pad.PaddingRight = UDim.new(0,8)

        TabBtn.MouseButton1Click:Connect(function()
            if CurrentContainer then
                TweenService:Create(CurrentContainer,TweenInfo.new(0.3,Enum.EasingStyle.Quint),{Position = UDim2.new(-1,0,0,10), BackgroundTransparency = 1}):Play()
                CurrentContainer.Visible = false
            end
            Container.Visible = true
            Container.Position = UDim2.new(1,0,0,10)
            TweenService:Create(Container,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{Position = UDim2.new(0,15,0,10)}):Play()
            CurrentContainer = Container

            for _,b in pairs(Sidebar:GetChildren()) do
                if b:IsA("TextButton") then
                    TweenService:Create(b:FindFirstChildOfClass("Frame"),TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
                end
            end
            TweenService:Create(Indicator,TweenInfo.new(0.3),{BackgroundTransparency=0}):Play()
        end)

        if not CurrentContainer then
            Container.Visible = true
            CurrentContainer = Container
            Indicator.BackgroundTransparency = 0
        end

        -- AddToggle, AddButton, AddSlider (same as before but cleaner)
        function Tab:AddToggle(d)
            local f = Instance.new("Frame")
            f.Size = UDim2.new(1,0,0,56)
            f.BackgroundColor3 = Theme.Main
            f.Parent = Container
            local c = Instance.new("UICorner",f); c.CornerRadius = UDim.new(0,16)

            local lbl = Instance.new("TextLabel",f)
            lbl.Text = d.Title or "Toggle"
            lbl.Size = UDim2.new(1,-100,1,0)
            lbl.Position = UDim2.new(0,20,0,0)
            lbl.BackgroundTransparency = 1
            lbl.TextColor3 = Theme.Text
            lbl.Font = Enum.Font.GothamBold
            lbl.TextSize = 17
            lbl.TextXAlignment = "Left"

            local sw = Instance.new("Frame",f)
            sw.Size = UDim2.new(0,70,0,36)
            sw.Position = UDim2.new(1,-90,0.5,-18)
            sw.BackgroundColor3 = d.Default and Theme.Success or Color3.fromRGB(70,70,70)
            local sc = Instance.new("UICorner",sw); sc.CornerRadius = UDim.new(1,0)

            local cir = Instance.new("Frame",sw)
            cir.Size = UDim2.new(0,30,0,30)
            cir.Position = d.Default and UDim2.new(1,-33,0.5,-15) or UDim2.new(0,3,0.5,-15)
            cir.BackgroundColor3 = Color3.new(1,1,1)
            local cc = Instance.new("UICorner",cir); cc.CornerRadius = UDim.new(1,0)

            local val = d.Default or false
            f.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                    val = not val
                    TweenService:Create(sw,TweenInfo.new(0.3,Enum.EasingStyle.Quart),{BackgroundColor3 = val and Theme.Success or Color3.fromRGB(70,70,70)}):Play()
                    TweenService:Create(cir,TweenInfo.new(0.3,Enum.EasingStyle.Quart),{Position = val and UDim2.new(1,-33,0.5,-15) or UDim2.new(0,3,0.5,-15)}):Play()
                    if d.Callback then d.Callback(val) end
                end
            end)
        end

        function Tab:AddButton(d)
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1,0,0,56)
            b.BackgroundColor3 = Theme.Main
            b.Text = d.Title or "Button"
            b.TextColor3 = Theme.Text
            b.Font = Enum.Font.GothamBold
            b.TextSize = 18
            b.Parent = Container
            local c = Instance.new("UICorner",b); c.CornerRadius = UDim.new(0,16)
            b.MouseButton1Click:Connect(d.Callback or function() end)
            b.MouseEnter:Connect(function() TweenService:Create(b,TweenInfo.new(0.2),{BackgroundColor3=Theme.Hover}):Play() end)
            b.MouseLeave:Connect(function() TweenService:Create(b,TweenInfo.new(0.2),{BackgroundColor3=Theme.Main}):Play() end)
        end

        function Tab:AddSlider(d)
            local s = Instance.new("Frame")
            s.Size = UDim2.new(1,0,0,78)
            s.BackgroundColor3 = Theme.Main
            s.Parent = Container
            local c = Instance.new("UICorner",s); c.CornerRadius = UDim.new(0,16)

            local t = Instance.new("TextLabel",s)
            t.Text = d.Title or "Slider"
            t.Size = UDim2.new(1,-100,0,30)
            t.Position = UDim2.new(0,20,0,10)
            t.BackgroundTransparency = 1
            t.TextColor3 = Theme.Text
            t.Font = Enum.Font.GothamBold
            t.TextSize = 17
            t.TextXAlignment = "Left"

            local v = Instance.new("TextLabel",s)
            v.Text = tostring(d.Default or d.Min)
            v.Size = UDim2.new(0,80,0,30)
            v.Position = UDim2.new(1,-100,0,10)
            v.BackgroundTransparency = 1
            v.TextColor3 = Theme.Accent
            v.Font = Enum.Font.GothamBold
            v.TextSize = 16

            local track = Instance.new("Frame",s)
            track.Size = UDim2.new(1,-40,0,12)
            track.Position = UDim2.new(0,20,0,50)
            track.BackgroundColor3 = Color3.fromRGB(60,60,60)
            local tc = Instance.new("UICorner",track); tc.CornerRadius = UDim.new(0,6)

            local fill = Instance.new("Frame",track)
            fill.Size = UDim2.new((d.Default-d.Min)/(d.Max-d.Min),0,1,0)
            fill.BackgroundColor3 = Theme.Accent
            local fc = Instance.new("UICorner",fill); fc.CornerRadius = UDim.new(0,6)

            local knob = Instance.new("Frame",fill)
            knob.Size = UDim2.new(0,26,0,26)
            knob.Position = UDim2.new(1,-13,-0.7,0)
            knob.BackgroundColor3 = Theme.Text
            local kc = Instance.new("UICorner",knob); kc.CornerRadius = UDim.new(1,0)

            local dragging = false
            track.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true end end)
            UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
            UserInputService.InputChanged:Connect(function(i)
                if dragging then
                    local p = math.clamp((i.Position.X - track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
                    local val = d.Min + p * (d.Max - d.Min)
                    fill.Size = UDim2.new(p,0,1,0)
                    v.Text = math.floor(val)
                    if d.Callback then d.Callback(val) end
                end
            end)
        end

        return Tab
    end

    return Window
end

return Library
