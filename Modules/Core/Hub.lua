local Hub = {}
local UI
local Page
local Components
Hub.CurrentPage = nil

Hub.Pages = {}

function Hub.Init(App)

    Page = App.Page
    Components = App.Components

end

function Hub.SetUI(NewUI)

    UI = NewUI

end

function Hub:CreatePage(Name)

    local NewPage = Page.new(Name)

    local Container = Components.CreateFrame({

        Name = Name,

        Size = UDim2.fromScale(1,1),

        BackgroundTransparency = 1,

        Visible = false,

        Parent = UI.Content

    })

    NewPage.Container = Container

    table.insert(self.Pages, NewPage)

    return NewPage

end

function Hub:SelectPage(Name)

    if self.CurrentPage == Name then
        return
    end

    for _, Page in ipairs(self.Pages) do

        if Page.Name == Name then

            Page:Show()

        else

            Page:Hide()

        end

    end

    self.CurrentPage = Name

end

return Hub
