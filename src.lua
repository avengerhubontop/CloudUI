-- DARKGREY UI LIBRARY | FINAL PERFECTION | 2025
-- FIXED EVERYTHING YOU HATED | ANIMATED | MOBILE + PC
-- loadstring(game:HttpGet("YOUR_GITHUB_LINK"))()

local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer

local Theme = {
    Background = Color3.fromRGB(14,14,14),
    Topbar = Color3.fromRGB(22,22,22),
    Sidebar = Color3.fromRGB(28,28,28),
    Main = Color3.fromRGB(35,35,35),
    Text = Color3.fromRGB(245,245,245),
    Accent = Color3.fromRGB(88,166,255),
    Hover = Color3.fromRGB(50,50,50),
    Success = Color3.fromRGB(0,170,140)
}

local Icons = {
    home = "Home", zap = "Zap", eye = "Eye", sword = "Sword", activity = "Activity", settings = "Settings",
    user = "User", shield = "Shield", menu = "Menu", x = "Close", minus = "Minimize", square = "Maximize"
}

function Library:Notify(data)
    spawn(function()
        local notif = Instance.new("Frame")
        notif.Size = UDim2.new(0,360,0,90)
        notif.Position = UDim2.new(1,-380,1,-110)
        notif.BackgroundColor3 = Theme.Main
        notif.Parent = CoreGui
        local corner = Instance.new("UICorner",notif); corner.CornerRadius = UDim.new(0,16)
        local stroke = Instance.new("UIStroke",notif); stroke.Color = Theme.Accent; stroke.Thickness = 2

        local title = Instance.new("TextLabel",notif)
        title.Text = data.Title or "Notification"
        title.Size = UDim2.new(1,-20,0,36)
        title.Position = UDim2.new(0,20,0,10)
        title.BackgroundTransparency = 1
        title.TextColor3 = Theme.Text
        title.Font = Enum.Font.GothamBold
        title.TextSize = 18
        title.TextXAlignment = "Left"

        local desc = Instance.new("TextLabel",notif)
        desc.Text = data.Content or ""
        desc.Size = UDim2.new(1,-20,0,30)
        desc.Position = UDim2.new(0,20,0,46)
        desc.BackgroundTransparency = 1
        desc.TextColor3 = Color3.fromRGB(170,170,170)
        desc.Font = Enum.Font.Gotham
        desc.TextSize = 14
        desc.TextXAlignment = "Left"

        TweenService:Create(notif,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{Position=UDim2.new(1,-20,1,-110)}):Play()
        task.wait(data.Duration or 4)
        TweenService:Create(notif,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{Position=UDim2.new(1,-380,1,-110)}):Play()
        task.wait(0.5) notif:Destroy()
    end)
end

function Library:CreateWindow(config)
    local Window = {}
    local Title = config.Title or "DarkGrey UI"
    local SubTitle = config.SubTitle or "Premium"
    local Size = config.Size or UDim2.new(0,620,0,500)
    local MinimizeKey = config.MinimizeKey or Enum.KeyCode.RightControl

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local Main = Instance.new("Frame")
    Main.Size = Size
    Main.Position = UDim2.new(0.5,-Size.X.Offset/2,0.5,-Size.Y.Offset/2)
    Main.BackgroundColor3 = Theme.Background
    Main.ClipsDescendants = true
    Main.Parent = ScreenGui
    local MainCorner = Instance.new("UICorner",Main); MainCorner.CornerRadius = UDim.new(0,18)
    local MainStroke = Instance.new("UIStroke",Main); MainStroke.Color = Theme.Accent; MainStroke.Thickness = 2

    local Topbar = Instance.new("Frame")
    Topbar.Size = UDim2.new(1,0,0,56)
    Topbar.BackgroundColor3 = Theme.Topbar
    Topbar.Parent = Main
    local TopCorner = Instance.new("UICorner",Topbar); TopCorner.CornerRadius = UDim.new(0,18)

    local TitleLabel = Instance.new("TextLabel",Topbar)
    TitleLabel.Text = Title
    TitleLabel.Size = UDim2.new(0,300,0,30)
    TitleLabel.Position = UDim2.new(0,22,0,6)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.Font = Enum.Font.GothamBlack
    TitleLabel.TextSize = 19
    TitleLabel.TextXAlignment = "Left"

    local SubLabel = Instance.new("TextLabel",Topbar)
    SubLabel.Text = SubTitle
    SubLabel.Size = UDim2.new(0,300,0,20)
    SubLabel.Position = UDim2.new(0,24,0,32)
    SubLabel.BackgroundTransparency = 1
    SubLabel.TextColor3 = Color3.fromRGB(140,140,140)
    SubLabel.Font = Enum.Font.Gotham
    SubLabel.TextSize = 13
    SubLabel.TextXAlignment = "Left"

    local CloseBtn = Instance.new("TextButton",Topbar)
    CloseBtn.Size = UDim2.new(0,40,0,40)
    CloseBtn.Position = UDim2.new(1,-52,0.5,-20)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(220,50,50)
    CloseBtn.Text = Icons.x
    CloseBtn.TextColor3 = Color3.new(1,1,1)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 20
    local cc = Instance.new("UICorner",CloseBtn); cc.CornerRadius = UDim.new(0,12)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local MaximizeBtn = Instance.new("TextButton",Topbar)
    MaximizeBtn.Size = UDim2.new(0,40,0,40)
    MaximizeBtn.Position = UDim2.new(1,-100,0.5,-20)
    MaximizeBtn.BackgroundColor3 = Theme.Hover
    MaximizeBtn.Text = Icons.square
    MaximizeBtn.TextColor3 = Theme.Text
    MaximizeBtn.Font = Enum.Font.GothamBold
    MaximizeBtn.TextSize = 18
    local mc = Instance.new("UICorner",MaximizeBtn); mc.CornerRadius = UDim.new(0,12)

    local MinimizeBtn = Instance.new("TextButton",Topbar)
    MinimizeBtn.Size = UDim2.new(0,40,0,40)
    MinimizeBtn.Position = UDim2.new(1,-148,0.5,-20)
    MinimizeBtn.BackgroundColor3 = Theme.Hover
    MinimizeBtn.Text = Icons.minus
    MinimizeBtn.TextColor3 = Theme.Text
    MinimizeBtn.Font = Enum.Font.GothamBold
    MinimizeBtn.TextSize = 24
    local mic = Instance.new("UICorner",MinimizeBtn); mic.CornerRadius = UDim.new(0,12)

    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0,170,1,-56)
    Sidebar.Position = UDim2.new(0,0,0,56)
    Sidebar.BackgroundColor3 = Theme.Sidebar
    Sidebar.Parent = Main

    local Content = Instance.new("Frame")
    Content.Size = UDim2.new(1,-170,1,-56)
    Content.Position = UDim2.new(0,170,0,56)
    Content.BackgroundTransparency = 1
    Content.Parent = Main

    local CurrentTab = nil
    local Minimized = false
    local OriginalSize = Main.Size
    local OriginalPos = Main.Position

    MinimizeBtn.MouseButton1Click:Connect(function()
        Minimized = not Minimized
        TweenService:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Quint),{Size = Minimized and UDim2.new(0,OriginalSize.X.Offset,0,56) or OriginalSize}):Play()
    end)

    MaximizeBtn.MouseButton1Click:Connect(function()
        if Main.Size == UDim2.new(1,-40,1,-40) then
            Main.Size = OriginalSize
            Main.Position = OriginalPos
        else
            OriginalSize = Main.Size
            OriginalPos = Main.Position
            Main.Size = UDim2.new(1,-40,1,-40)
            Main.Position = UDim2.new(0,20,0,20)
        end
    end)

    UserInputService.InputBegan:Connect(function(i,gp)
        if not gp and i.KeyCode == MinimizeKey then MinimizeBtn.MouseButton1Click:Fire() end
    end)

    local dragging = false
    Topbar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local delta = i.Position - Main.Position
            local conn; conn = i.Changed:Connect(function()
                if i.UserInputState == Enum.UserInputState.End then dragging = false; conn:Disconnect() end
            end)
            UserInputService.InputChanged:Connect(function(i2)
                if dragging and i2.UserInputType == Enum.UserInputType.MouseMovement then
                    Main.Position = i2.Position - delta
                end
            end)
        end
    end)

    function Window:AddTab(cfg)
        local Tab = {}
        local Name = cfg.Title or "Tab"
        local Icon = cfg.Icon or "home"

        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1,-16,0,48)
        TabButton.Position = UDim2.new(0,8,0,8+#Sidebar:GetChildren()*56)
        TabButton.BackgroundColor3 = Theme.Main
        TabButton.Text = "  "..Icon.."  "..Name
        TabButton.TextColor3 = Theme.Text
        TabButton.Font = Enum.Font.GothamBold
        TabButton.TextSize = 15
        TabButton.TextXAlignment = "Left"
        TabButton.Parent = Sidebar
        local bc = Instance.new("UICorner",TabButton); bc.CornerRadius = UDim.new(0,12)

        local Indicator = Instance.new("Frame",TabButton)
        Indicator.Size = UDim2.new(0,4,1,0)
        Indicator.BackgroundColor3 = Theme.Accent
        Indicator.BackgroundTransparency = 1

        local Container = Instance.new("ScrollingFrame")
        Container.Size = UDim2.new(1,-24,1,-16)
        Container.Position = UDim2.new(0,12,0,8)
        Container.BackgroundTransparency = 1
        Container.ScrollBarThickness = 4
        Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Container.Visible = false
        Container.Parent = Content
        local Layout = Instance.new("UIListLayout",Container)
        Layout.Padding = UDim.new(0,10)
        local Padding = Instance.new("UIPadding",Container)
        Padding.PaddingTop = UDim.new(0,8)

        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then CurrentTab.Visible = false end
            Container.Visible = true
            CurrentTab = Container
            for _,b in pairs(Sidebar:GetChildren()) do
                if b:IsA("TextButton") then
                    TweenService:Create(b:FindFirstChildOfClass("Frame"),TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
                end
            end
            TweenService:Create(Indicator,TweenInfo.new(0.3),{BackgroundTransparency=0}):Play()
        end)

        if not CurrentTab then
            Container.Visible = true
            CurrentTab = Container
            Indicator.BackgroundTransparency = 0
        end

        function Tab:AddToggle(data)
            local Toggle = Instance.new("Frame")
            Toggle.Size = UDim2.new(1,0,0,52)
            Toggle.BackgroundColor3 = Theme.Main
            Toggle.Parent = Container
            local tc = Instance.new("UICorner",Toggle); tc.CornerRadius = UDim.new(0,14)

            local Label = Instance.new("TextLabel",Toggle)
            Label.Text = data.Title or "Toggle"
            Label.Size = UDim2.new(1,-90,1,0)
            Label.Position = UDim2.new(0,18,0,0)
            Label.BackgroundTransparency = 1
            Label.TextColor3 = Theme.Text
            Label.Font = Enum.Font.GothamBold
            Label.TextSize = 16
            Label.TextXAlignment = "Left"

            local Switch = Instance.new("Frame",Toggle)
            Switch.Size = UDim2.new(0,64,0,32)
            Switch.Position = UDim2.new(1,-82,0.5,-16)
            Switch.BackgroundColor3 = data.Default and Theme.Success or Color3.fromRGB(65,65,65)
            local sc = Instance.new("UICorner",Switch); sc.CornerRadius = UDim.new(1,0)

            local Circle = Instance.new("Frame",Switch)
            Circle.Size = UDim2.new(0,26,0,26)
            Circle.Position = data.Default and UDim2.new(1,-30,0.5,-13) or UDim2.new(0,4,0.5,-13)
            Circle.BackgroundColor3 = Color3.new(1,1,1)
            local cc = Instance.new("UICorner",Circle); cc.CornerRadius = UDim.new(1,0)

            local Enabled = data.Default or false
            Toggle.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                    Enabled = not Enabled
                    TweenService:Create(Switch,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{BackgroundColor3 = Enabled and Theme.Success or Color3.fromRGB(65,65,65)}):Play()
                    TweenService:Create(Circle,TweenInfo.new(0.25,Enum.EasingStyle.Quart),{Position = Enabled and UDim2.new(1,-30,0.5,-13) or UDim2.new(0,4,0.5,-13)}):Play()
                    if data.Callback then data.Callback(Enabled) end
                end
            end)
        end

        function Tab:AddButton(data)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1,0,0,52)
            Button.BackgroundColor3 = Theme.Main
            Button.Text = data.Title or "Button"
            Button.TextColor3 = Theme.Text
            Button.Font = Enum.Font.GothamBold
            Button.TextSize = 17
            Button.Parent = Container
            local bc = Instance.new("UICorner",Button); bc.CornerRadius = UDim.new(0,14)
            Button.MouseButton1Click:Connect(data.Callback or function() end)
            Button.MouseEnter:Connect(function() TweenService:Create(Button,TweenInfo.new(0.2),{BackgroundColor3=Theme.Hover}):Play() end)
            Button.MouseLeave:Connect(function() TweenService:Create(Button,TweenInfo.new(0.2),{BackgroundColor3=Theme.Main}):Play() end)
        end

        function Tab:AddSlider(data)
            local Slider = Instance.new("Frame")
            Slider.Size = UDim2.new(1,0,0,70)
            Slider.BackgroundColor3 = Theme.Main
            Slider.Parent = Container
            local sc = Instance.new("UICorner",Slider); sc.CornerRadius = UDim.new(0,14)

            local Title = Instance.new("TextLabel",Slider)
            Title.Text = data.Title or "Slider"
            Title.Size = UDim2.new(1,-100,0,30)
            Title.Position = UDim2.new(0,18,0,6)
            Title.BackgroundTransparency = 1
            Title.TextColor3 = Theme.Text
            Title.Font = Enum.Font.GothamBold
            Title.TextSize = 16
            Title.TextXAlignment = "Left"

            local ValueLabel = Instance.new("TextLabel",Slider)
            ValueLabel.Text = tostring(data.Default or data.Min)
            ValueLabel.Size = UDim2.new(0,80,0,30)
            ValueLabel.Position = UDim2.new(1,-98,0,6)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.TextColor3 = Theme.Accent
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextSize = 15

            local Track = Instance.new("Frame",Slider)
            Track.Size = UDim2.new(1,-36,0,10)
            Track.Position = UDim2.new(0,18,0,46)
            Track.BackgroundColor3 = Color3.fromRGB(60,60,60)
            local tc = Instance.new("UICorner",Track); tc.CornerRadius = UDim.new(0,6)

            local Fill = Instance.new("Frame",Track)
            Fill.Size = UDim2.new((data.Default-data.Min)/(data.Max-data.Min),0,1,0)
            Fill.BackgroundColor3 = Theme.Accent
            local fc = Instance.new("UICorner",Fill); fc.CornerRadius = UDim.new(0,6)

            local Knob = Instance.new("Frame",Fill)
            Knob.Size = UDim2.new(0,22,0,22)
            Knob.Position = UDim2.new(1,-11,-0.6,0)
            Knob.BackgroundColor3 = Theme.Text
            local kc = Instance.new("UICorner",Knob); kc.CornerRadius = UDim.new(1,0)

            local dragging = false
            Track.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true end
            end)
            UserInputService.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end
            end)
            UserInputService.InputChanged:Connect(function(i)
                if dragging then
                    local rel = math.clamp((i.Position.X - Track.AbsolutePosition.X)/Track.AbsoluteSize.X,0,1)
                    local val = data.Min + rel * (data.Max - data.Min)
                    Fill.Size = UDim2.new(rel,0,1,0)
                    ValueLabel.Text = math.floor(val)
                    if data.Callback then data.Callback(val) end
                end
            end)
        end

        return Tab
    end

    return Window
end

return Library
