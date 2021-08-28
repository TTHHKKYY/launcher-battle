local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Include = ReplicatedStorage.Common.include
local Remotes = ReplicatedStorage.Common.remotes

local Caster = require(Include.ray)

Remotes.Push.OnServerEvent:Connect(function(Player,Ray)
	for _,Target in pairs(Players:GetPlayers()) do
		if Target == Player then
			print("skip owner")
			continue
		else
			local Character = Target.Character
			local Root = Target.Character.PrimaryPart
			
			local Head = Ray.Unit.Origin
			local Look = Ray.Unit.Direction * 32
			
			--i want the raycast function to fit on one line
			--vim has very large indentation
			
			if Character and Root then
				local Result = Caster(Head,Look,Character,true)
				
				if Result.Part then
					print("hit")
					
					Character.Humanoid.Jump = true
					task.wait(1 / 30) --what
					Root.Velocity = Look * 10
					break
				end
			end
		end
	end
end)
