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

local App = {}

App.Theme = Theme
App.Components = Components
App.Assets = Assets
App.Build = Build

Components.Init(App)
Build.Init(App)

local UI = Build.Build()
