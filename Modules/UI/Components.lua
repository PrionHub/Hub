local Components = {}

local Theme

local function ApplyProperties(Object, Properties)

    if not Properties then
        return
    end

    for Property, Value in pairs(Properties) do

        Object[Property] = Value

    end

end

function Components.Init(App)

    Theme = App.Theme

end

function Components.CreateFrame(Properties)

    local Frame = Instance.new("Frame")

    Frame.BackgroundColor3 =
        Theme.Colors.Background

    Frame.BorderSizePixel = 0

    ApplyProperties(Frame, Properties)

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

    ApplyProperties(Label, Properties)

    return Label

end

function Components.CreateCorner(Parent, Radius)

    local Corner = Instance.new("UICorner")

    Corner.CornerRadius = Radius or UDim.new(0, 4)

    Corner.Parent = Parent

    return Corner

end

function Components.CreateStroke(Parent, Properties)

    local Stroke = Instance.new("UIStroke")

    Stroke.Color = Theme.Colors.Stroke

    Stroke.Thickness = 1

    ApplyProperties(Stroke, Properties)

    Stroke.Parent = Parent

    return Stroke

end

function Components.CreateListLayout(Properties)

    local Layout = Instance.new("UIListLayout")

    Layout.FillDirection = Enum.FillDirection.Vertical
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    ApplyProperties(Layout, Properties)

    return Layout

end

return Components
