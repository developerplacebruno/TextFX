--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextFX = require(ReplicatedStorage.Packages.TextFX)

local label = script.Parent

task.spawn(function()
	local cash = 0

	while true do
		cash += 15
		TextFX.Counting(label, cash, { prefix = "$" })
		task.wait(2)
	end
end)
