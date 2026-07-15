local Base =
    "https://raw.githubusercontent.com/PrionHub/Hub/main/"

local Theme =
    loadstring(game:HttpGet(Base.."Modules/UI/Theme.lua"))()

local Components =
    loadstring(game:HttpGet(Base.."Modules/UI/Components.lua"))()

local Assets =
    loadstring(game:HttpGet(Base.."Modules/Utils/Assets.lua"))()

local Build =
    loadstring(game:HttpGet(Base.."Modules/UI/Build.lua"))()

local Page =
    loadstring(game:HttpGet(Base.."Modules/UI/Page.lua"))()

local Hub =
    loadstring(game:HttpGet(Base.."Modules/Core/Hub.lua"))()

local Sidebar =
    loadstring(game:HttpGet(Base.."Modules/UI/Sidebar.lua"))()

local Animation =
    loadstring(game:HttpGet(Base.."Modules/Utils/Animation.lua"))()

local App = {}

App.Theme = Theme
App.Components = Components
App.Assets = Assets
App.Build = Build
App.Page = Page
App.Hub = Hub
App.Sidebar = Sidebar
App.Animation = Animation

Components.Init(App)
Build.Init(App)
Hub.Init(App)
Sidebar.Init(App)

local UI = Build.Build()

Sidebar.Build(UI)
