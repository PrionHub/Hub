local Build = {}

local Theme
local Components
local Assets

function Build.Init(App)

    Theme = App.Theme
    Components = App.Components
    Assets = App.Assets

end

function Build.Build()

    local UI = {}

    local Players = game:GetService("Players")

    local player = Players.LocalPlayer

    -- ScreenGui

    UI.ScreenGui = Instance.new("ScreenGui")

    UI.ScreenGui.Name = "PrionHub"

    UI.ScreenGui.ResetOnSpawn = false

    UI.ScreenGui.Parent = game:GetService("CoreGui")

    -- MainFrame

    UI.MainFrame = Components.CreateFrame({

        Size = Theme.Sizes.MainFrame,

        Position = UDim2.fromScale(0.5, 0.5),

        AnchorPoint = Vector2.new(0.5, 0.5),

        Parent = UI.ScreenGui

    })

    local Corner = Instance.new("UICorner")

    Corner.CornerRadius = UDim.new(0, 4)

    Corner.Parent = UI.MainFrame

    local Stroke = Instance.new("UIStroke")

    Stroke.Color = Theme.Colors.Stroke

    Stroke.Thickness = 2

    Stroke.Parent = UI.MainFrame
    
    -- Logo

    UI.Logo = Instance.new("ImageLabel")

    UI.Logo.Size = UDim2.fromOffset(100, 80)

    UI.Logo.Position = UDim2.fromOffset(8, -5)

    UI.Logo.BackgroundTransparency = 1

    UI.Logo.Parent = UI.MainFrame

    Assets.LoadImage(UI.Logo)

    -- Sidebar

    UI.Sidebar = Instance.new("Frame")

    UI.Sidebar.Size = UDim2.new(

        0,
        Theme.Sizes.SidebarWidth,
    
        1,
        0
    
    )
    
    UI.Sidebar.Position = UDim2.fromOffset(0, 0)
    UI.Sidebar.BackgroundTransparency = 1

    UI.Sidebar.Parent = UI.MainFrame

    local SidebarLine = Instance.new("Frame")

    SidebarLine.Size = UDim2.new(0, 1, 1, 0)

    SidebarLine.Position = UDim2.new(1, -1, 0, 0)

    SidebarLine.BackgroundColor3 = Theme.Colors.Stroke

    SidebarLine.BorderSizePixel = 0

    SidebarLine.Parent = UI.Sidebar

    -- Profile

    UI.Profile = Instance.new("Frame")

    UI.Profile.Size = UDim2.new(

        1,
        0,

        0,
        Theme.Sizes.ProfileHeight

    )

    UI.Profile.Position = UDim2.new(

        0,
        0,

        1,
        -Theme.Sizes.ProfileHeight

    )

    UI.Profile.BackgroundTransparency = 1

    UI.Profile.Parent = UI.Sidebar

    local ProfileLine = Instance.new("Frame")

    ProfileLine.Size = UDim2.new(1, 0, 0, 1)

    ProfileLine.BackgroundColor3 = Theme.Colors.Stroke

    ProfileLine.BorderSizePixel = 0

    ProfileLine.Parent = UI.Profile

    -- Avatar

    UI.Avatar = Instance.new("Frame")

    UI.Avatar.Size = UDim2.fromOffset(32, 32)

    UI.Avatar.Position = UDim2.fromOffset(10, 9)

    UI.Avatar.BackgroundColor3 = Theme.Colors.Avatar

    UI.Avatar.Parent = UI.Profile

    local AvatarCorner = Instance.new("UICorner")

    AvatarCorner.CornerRadius = UDim.new(1, 0)

    AvatarCorner.Parent = UI.Avatar

    -- Username

    UI.Username = Components.CreateLabel({

        Size = UDim2.fromOffset(100, 16),

        Position = UDim2.fromOffset(50, 8),

        Text = player.Name,

        Font = Theme.Fonts.Bold,

        TextSize = 12,

        TextXAlignment = Enum.TextXAlignment.Left,

        Parent = UI.Profile

    })

    -- Rank

    UI.Rank = Components.CreateLabel({

        Size = UDim2.fromOffset(100, 14),

        Position = UDim2.fromOffset(50, 24),

        Text = "Premium",

        TextColor3 = Theme.Colors.SecondaryText,

        TextSize = 10,

        TextXAlignment = Enum.TextXAlignment.Left,

        Parent = UI.Profile

    })

    -- Content

    UI.Content = Instance.new("Frame")

    UI.Content.Size = UDim2.new(

        1,
        -180,
    
        1,
        0
    
    )
    
    UI.Content.Position = UDim2.fromOffset(180, 0)

    UI.Content.BackgroundTransparency = 1

    UI.Content.Parent = UI.MainFrame

    return UI

end

return Build
