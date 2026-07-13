local Theme =
    loadstring(game:HttpGet(...))()

local Components =
    loadstring(game:HttpGet(...))()

local Assets =
    loadstring(game:HttpGet(...))()

local Build =
    loadstring(game:HttpGet(...))()

local App = {}

App.Theme = Theme
App.Components = Components
App.Assets = Assets
App.Build = Build

Components.Init(App)
Build.Init(App)

local UI = Build.Build()
