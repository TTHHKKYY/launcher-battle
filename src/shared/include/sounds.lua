local Module = {}

local Sounds =
{
	[1] = 7347520659
}

function Module.Play(Index)
	local Sound = Instance.new("Sound")
	local Content = Sounds[Index]
	
	Sound.Volume = 1
	Sound.SoundId = "rbxassetid://" .. Content
	Sound.Parent = workspace
	
	Sound:Play()
	
	spawn(function()
		Sound.Stopped:Wait()
		Sound:Destroy()
	end)
end

return Module
