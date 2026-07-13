local Sidebar = {}

local Theme
local Components
local Navigation
local Buttons = {}

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

function Sidebar.AddButton(Name)

    local Button = Components.CreateFrame({

        Name = Name,

        Size = UDim2.new(1, 0, 0, 32),

        BackgroundTransparency = 1,

        Parent = Navigation

    })

    Components.CreateCorner(Button)

    local Stroke = Components.CreateStroke(Button, {
    
        Enabled = false
    
    })

    local Label = Components.CreateLabel({

        Size = UDim2.new(1, 0, 1, 0),

        Text = Name,

        TextSize = 14,

        Parent = Button

    })

    Buttons[Name] = {

        Frame = Button,

        Stroke = Stroke,

        Label = Label

    }

end

return Sidebar
