local Page = {}

Page.__index = Page

function Page.new(Name)

    local self = setmetatable({}, Page)

    self.Name = Name

    self.Container = nil

    self.Elements = {}

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

return Page
