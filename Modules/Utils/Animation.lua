local Animation = {}

local TweenService = game:GetService("TweenService")

Animation.Info = {

    Fast = TweenInfo.new(
        0.12,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    ),

    Normal = TweenInfo.new(
        0.20,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    ),

    Slow = TweenInfo.new(
        0.35,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )

}

function Animation.Tween(Object, Info, Properties)

    local Tween = TweenService:Create(
        Object,
        Info,
        Properties
    )

    Tween:Play()

    return Tween

end

function Animation.Play(Object, Properties)

    return Animation.Tween(

        Object,

        Animation.Info.Fast,

        Properties

    )

end

return Animation
