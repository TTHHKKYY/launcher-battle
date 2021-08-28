local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Mouse = Players.LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local Include = ReplicatedStorage.Common.include
local Remotes = ReplicatedStorage.Common.remotes

local Shake = require(Include.shaker)
local Sound = require(Include.sounds)
local Clock = require(Include.clock)

local Shaker = Shake.new(Camera)
local Timer = Clock.new()

Mouse.Button1Down:Connect(function()
	if Timer:Check(1) then
		Timer:Start()
		Sound.Play(1)
		Remotes.Push:FireServer(Mouse.UnitRay)
	end
end)

Remotes.Attacked.OnClientEvent:Connect(function()
	Shaker:Shake(2)
	print("attacked!")
	
	for i=1,200 do
		Shaker:Update(task.wait())
	end
end)
