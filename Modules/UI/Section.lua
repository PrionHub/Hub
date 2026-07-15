local Section = {}
local Components
local Section

function Page.Init(App)

    Components = App.Components
    Section = App.Section

end

Section.__index = Section

function Section.new(Name)

    local self = setmetatable({}, Section)

    self.Name = Name

    self.Container = nil

    self.Elements = {}

    return self

end

return Section
