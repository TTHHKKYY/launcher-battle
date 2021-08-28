local Module = {}

function Module.new(Camera)
	local self = {}
	local Delta = Vector3.new()
	
	function self:Shake(Strength)
		local x = math.random() * Strength
		local y = math.random() * Strength
		local z = math.random() * Strength
		
		Delta = Vector3.new(x,y,z)
	end
	
	function self:Update(Time)
		local x = math.rad(Delta.x)
		local y = math.rad(Delta.y)
		local z = math.rad(Delta.z)
		
		Camera.CFrame = Camera.CFrame * CFrame.Angles(x,y,z)
		Delta = Delta:Lerp(Vector3.new(),Time)
	end
	
	return self
end

return Module
