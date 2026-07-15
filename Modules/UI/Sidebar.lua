local Sidebar = {}

local TweenService = game:GetService("TweenService")

local Theme
local Components
local Navigation
Sidebar.Buttons = {}

function Sidebar.Init(App)

    Theme = App.Theme
    Components = App.Components

end

Sidebar.Selected = nil

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

    local Frame = Components.CreateFrame({

        Name = Name,

        Size = UDim2.new(1, 0, 0, 32),

        Parent = Navigation

    })

    Components.CreateCorner(Frame)

    local Stroke = Components.CreateStroke(Frame, {

        Enabled = false

    })

    local Button = Components.CreateButton({

        Size = UDim2.new(1, 0, 1, 0),

        BackgroundTransparency = 1,

        Text = Name,

        Parent = Frame

    })

    Components.CreatePadding(Button, {

        PaddingLeft = UDim.new(0, 10)
    
    })

    local ButtonObject = {

        Name = Name,

        Container = Frame,

        Button = Button,

        Stroke = Stroke,

        Selected = false,

        OriginalSize = Frame.Size

    }

    function ButtonObject:Select()
    
        self.Selected = true

        self.Stroke.Enabled = true
        
        TweenService:Create(
        
            self.Frame,
        
            TweenInfo.new(
        
                0.12,
        
                Enum.EasingStyle.Quad,
        
                Enum.EasingDirection.Out
        
            ),
        
            {
        
                Size = self.Size + UDim2.fromOffset(4, 2)
        
            }
        
        ):Play()
    
    end
    
    function ButtonObject:Deselect()
    
        self.Selected = false
        self.Stroke.Enabled = false
    
    end

    Sidebar.Buttons[Name] = ButtonObject

    Button.MouseButton1Click:Connect(function()

        Sidebar.Select(Name)
    
    end)

    return ButtonObject

end

function Sidebar.Select(Name)

    for _, ButtonObject in pairs(Sidebar.Buttons) do

        if ButtonObject.Name == Name then
            ButtonObject:Select()
        else
            ButtonObject:Deselect()
        end

    end

    Sidebar.Selected = Name

end

return Sidebar
