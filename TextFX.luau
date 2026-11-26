--!strict
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local TextFX = {}

local connections: { [TextLabel]: RBXScriptConnection } = {}
local values: { [TextLabel]: number } = {}

function TextFX.Counting(
	textLabel: TextLabel,
	number: number,
	args: {
		duration: number?,
		easingDirection: Enum.EasingDirection?,
		easingStyle: Enum.EasingStyle?,
		prefix: string?,
		suffix: string?,
	}?
)
	local duration = (args and args.duration) or 0.5
	local easingDirection = (args and args.easingDirection) or Enum.EasingDirection.InOut
	local easingStyle = (args and args.easingStyle) or Enum.EasingStyle.Quad
	local prefix = (args and args.prefix) or ""
	local suffix = (args and args.suffix) or ""

	local elapsed = 0
	local startValue = values[textLabel] or 0

	if connections[textLabel] then
		connections[textLabel]:Disconnect()
	end

	connections[textLabel] = RunService.PreRender:Connect(function(dt)
		elapsed += dt

		local alpha = elapsed / duration
		local easedAlpha = TweenService:GetValue(alpha, easingStyle, easingDirection)
		local value = startValue + (number - startValue) * easedAlpha

		values[textLabel] = value
		textLabel.Text = prefix .. tostring(math.round(value)) .. suffix

		if alpha >= 1 then
			connections[textLabel]:Disconnect()
			connections[textLabel] = nil
		end
	end)
end

function TextFX.Typewriter(
	textLabel: TextLabel,
	text: string,
	args: {
		duration: number?,
		easingDirection: Enum.EasingDirection?,
		easingStyle: Enum.EasingStyle?,
	}?
)
	local duration = (args and args.duration) or 0.5
	local easingDirection = (args and args.easingDirection) or Enum.EasingDirection.InOut
	local easingStyle = (args and args.easingStyle) or Enum.EasingStyle.Quad
	local total = #text

	textLabel.Text = ""

	local elapsed = 0

	if connections[textLabel] then
		connections[textLabel]:Disconnect()
	end

	connections[textLabel] = RunService.PreRender:Connect(function(dt)
		elapsed += dt

		local alpha = elapsed / duration
		local easedAlpha = TweenService:GetValue(alpha, easingStyle, easingDirection)
		local value = math.round(easedAlpha * total)

		textLabel.Text = string.sub(text, 1, value)

		if alpha >= 1 then
			connections[textLabel]:Disconnect()
			connections[textLabel] = nil
		end
	end)
end

return TextFX
