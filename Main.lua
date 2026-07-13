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

local App = {}

App.Theme = Theme
App.Components = Components
App.Assets = Assets
App.Build = Build
App.Page = Page
App.Hub = Hub

Components.Init(App)
Build.Init(App)
Hub.Init(App)

local UI = Build.Build()


local Main = Hub:CreatePage("Main")
local Game = Hub:CreatePage("Game")
local Visual = Hub:CreatePage("Visual")
local Themes = Hub:CreatePage("Themes")
local Settings = Hub:CreatePage("Settings")

print(#Hub.Pages)
