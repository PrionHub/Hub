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

        Parent = Parent

    })

    NewSection.Container = Container

    table.insert(self.Sections, NewSection)

    return NewSection

end

return Page
