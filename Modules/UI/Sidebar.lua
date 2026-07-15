local Sidebar = {}

local Theme
local Animation
local Components
local Navigation
Sidebar.Buttons = {}
Sidebar.Selected = nil

Sidebar.Pages = {

    {
        Name = "Main"
    },

    {
        Name = "Game"
    },

    {
        Name = "Visual"
    },

    {
        Name = "Themes"
    },

    {
        Name = "Settings"
    }

}

function Sidebar.Init(App)

    Theme = App.Theme
    Components = App.Components
    Animation = App.Animation

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

    for _, Page in ipairs(Sidebar.Pages) do

        Sidebar.AddButton(Page)
    
    end
    
    Sidebar.Select(Sidebar.Pages[1].Name)

end

function Sidebar.AddButton(Page)

    local Name = Page.Name

    local Frame = Components.CreateFrame({

        Name = Name,

        Size = UDim2.new(1, 0, 0, 32),

        Parent = Navigation

    })

    Components.CreateCorner(Frame)

    local Stroke = Components.CreateStroke(Frame, {

        Transparency = 1
    
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

    }

    function ButtonObject:Select()

        self.Selected = true
    
        Animation.Play(self.Stroke, {
    
            Transparency = 0
    
        })
    
        Animation.Play(self.Container, {
    
            BackgroundColor3 = Theme.Colors.SidebarSelected
    
        })
    
    end
    
    function ButtonObject:Deselect()

        self.Selected = false
    
        Animation.Play(self.Stroke, {
    
            Transparency = 1
    
        })
    
        Animation.Play(self.Container, {
    
            BackgroundColor3 = Theme.Colors.Sidebar
    
        })
    
    end

    Sidebar.Buttons[Name] = ButtonObject

    Button.MouseButton1Click:Connect(function()

        Sidebar.Select(Name)
    
    end)

    return ButtonObject

end

function Sidebar.Select(Name)

    if Sidebar.Selected == Name then
        return
    end

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
