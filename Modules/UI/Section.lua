local Section = {}

local Components

function Section.Init(App)

    Components = App.Components

end

Section.__index = Section

function Section.new(Name)

    local self = setmetatable({}, Section)

    self.Name = Name
    self.Container = nil
    self.Header = nil
    self.Content = nil
    self.Elements = {}

    return self

end

function Section:Build(Parent)

    self.Container = Components.CreateFrame({

        Name = self.Name,

        Size = UDim2.new(1, 0, 0, 150),

        BackgroundTransparency = 1,

        Parent = Parent

    })

end

return Section
