local Sidebar = {}

local Theme
local Components
local Navigation
Sidebar.Buttons = {}

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

    Components.CreateListLayout({

        Padding = UDim.new(0,6),
    
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
    
        Parent = Navigation
    
    })

end

function Sidebar.AddButton(Properties)

    local Name = Properties.Name
    local Button = Components.CreateButton({

        Name = Name,
    
        Text = Name,
    
        Size = UDim2.new(1, 0, 0, 32),
    
        Parent = Navigation
    
    })

    Components.CreateCorner(Button)

    local Stroke = Components.CreateStroke(Button, {
    
        Enabled = false
    
    })

    local ButtonObject = {

        Name = Name,
    
        Button = Button,
    
        Stroke = Stroke,
    
        Selected = false
    
    }
    
    Sidebar.Buttons[Name] = ButtonObject
    
    return ButtonObject

end

return Sidebar
