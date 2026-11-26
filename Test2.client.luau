--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextFX = require(ReplicatedStorage.Packages.TextFX)

local label = script.Parent

task.spawn(function()
	while true do
		TextFX.Typewriter(label, "Collect $10!")
		task.wait(5)
		TextFX.Typewriter(label, "Buy a basic egg!")
		task.wait(5)
		TextFX.Typewriter(label, "Upgrade your egg!")
		task.wait(5)
	end
end)
