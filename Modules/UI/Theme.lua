local Theme = {}

Theme.Colors = {

    Background = Color3.fromRGB(10, 10, 10),

    SidebarSelected = Color3.fromRGB(18,18,18),

    Stroke = Color3.fromRGB(220, 40, 40),

    Text = Color3.new(1, 1, 1),

    SecondaryText = Color3.fromRGB(170, 170, 170),

    Avatar = Color3.fromRGB(40, 40, 40)

}

Theme.Fonts = {

    Bold = Enum.Font.GothamBold,

    Regular = Enum.Font.Gotham,

    Sidebar = Font.fromName("Michroma")

}

Theme.Sizes = {

    MainFrame = UDim2.fromOffset(660, 330),

    HeaderHeight = 55,

    SidebarWidth = 160,

    ProfileHeight = 50

}

return Theme
