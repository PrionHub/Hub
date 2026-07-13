local Components = {}

local Theme

function Components.Init(App)

    Theme = App.Theme

end

function Components.CreateFrame(Properties)

    local Frame = Instance.new("Frame")

    Frame.BackgroundColor3 =
        Theme.Colors.Background

    Frame.BorderSizePixel = 0

    for Property, Value in pairs(Properties) do

        Frame[Property] = Value

    end

    return Frame

end

function Components.CreateLabel(Properties)

    local Label = Instance.new("TextLabel")

    Label.BackgroundTransparency = 1

    Label.TextColor3 =
        Theme.Colors.Text

    Label.Font =
        Theme.Fonts.Regular

    Label.BorderSizePixel = 0

    for Property, Value in pairs(Properties) do

        Label[Property] = Value

    end

    return Label

end

return Components
