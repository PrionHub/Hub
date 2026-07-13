local Page = {}
Page.__index = Page

function Page.new(Name)

    local self = setmetatable({}, Page)

    self.Name = Name
    self.Frame = nil
    self.Sections = {}

    return self

end

return Page
