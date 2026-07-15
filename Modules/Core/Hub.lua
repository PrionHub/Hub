local Hub = {}
local UI
local Page

Hub.Pages = {}

function Hub.Init(App)

    Page = App.Page

end

function Hub.SetUI(NewUI)

    UI = NewUI

end

function Hub:CreatePage(Name)

    local NewPage = Page.new(Name)

    table.insert(self.Pages, NewPage)

    return NewPage

end

return Hub
