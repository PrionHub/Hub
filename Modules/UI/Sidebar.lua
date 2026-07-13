local Sidebar = {}

local Theme
local Components
local Navigation

function Sidebar.Init(App)

    Theme = App.Theme
    Components = App.Components

end

function Sidebar.Build(UI)

    Navigation = Components.CreateFrame({

        Name = "Navigation",

        Size = UDim2.new(1, -16, 0, 180),

        Position = UDim2.fromOffset(8, 65),

        BackgroundTransparency = 1,

        Parent = UI.Sidebar

    })

    local Layout = Instance.new("UIListLayout")

    Layout.Padding = UDim.new(0, 6)

    Layout.FillDirection = Enum.FillDirection.Vertical

    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    Layout.Parent = Navigation

end

return Sidebar
