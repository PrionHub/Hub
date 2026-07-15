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

Animation.Active = {}

function Animation.Tween(Object, Info, Properties)

    local CurrentTween = Animation.Active[Object]

    if CurrentTween then

        CurrentTween:Cancel()

    end

    local Tween = TweenService:Create(

        Object,

        Info,

        Properties

    )

    Animation.Active[Object] = Tween

    Tween:Play()

    Tween.Completed:Connect(function()

        if Animation.Active[Object] == Tween then

            Animation.Active[Object] = nil

        end

    end)

    return Tween

end

function Animation.Stop(Tween)

    if Tween then
        Tween:Cancel()
    end

end

return Animation
