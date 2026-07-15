local Page = {}

local Components
local Section

function Page.Init(App)

    Components = App.Components
    Section = App.Section

end

Page.__index = Page

function Page.new(Name)

    local self = setmetatable({}, Page)

    self.Name = Name

    self.Container = nil

    self.Sections = {}

    self.NextColumn = "Left"

    self.Visible = false

    return self

end

function Page:Build(Parent)

    self.Container = Components.CreateFrame({

        Name = self.Name,

        Size = UDim2.fromScale(1, 1),

        BackgroundTransparency = 1,

        Visible = false,

        Parent = Parent

    })

    self.LeftColumn = Components.CreateFrame({

        Name = "LeftColumn",

        Size = UDim2.new(0.5, -6, 1, 0),

        BackgroundTransparency = 1,

        Parent = self.Container

    })

    Components.CreateListLayout({

        Padding = UDim.new(0, 10),

        Parent = self.LeftColumn

    })

    self.RightColumn = Components.CreateFrame({

        Name = "RightColumn",

        Size = UDim2.new(0.5, -6, 1, 0),

        Position = UDim2.new(0.5, 6, 0, 0),

        BackgroundTransparency = 1,

        Parent = self.Container

    })

    Components.CreateListLayout({

        Padding = UDim.new(0, 10),

        Parent = self.RightColumn

    })

end

function Page:Show()

    self.Visible = true

    if self.Container then
        self.Container.Visible = true
    end

end

function Page:Hide()

    self.Visible = false

    if self.Container then
        self.Container.Visible = false
    end

end

function Page:AddSection(Name)

    local NewSection = Section.new(Name)

    local Parent

    if self.NextColumn == "Left" then

        Parent = self.LeftColumn
        self.NextColumn = "Right"

    else

        Parent = self.RightColumn
        self.NextColumn = "Left"

    end

    local Container = Components.CreateFrame({

        Name = Name,

        Size = UDim2.new(1, 0, 0, 150),

        BackgroundTransparency = 1,

        Parent = Parent

    })

    NewSection.Container = Container

    table.insert(self.Sections, NewSection)

    return NewSection

end

return Page
