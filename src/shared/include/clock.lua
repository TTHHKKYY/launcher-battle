local Module = {}

function Module.new()
	local self = {}
	local Time = 0
	
	function self:Start()
		Time = os.clock()
	end
	
	function self:Time()
		return os.clock() - Time
	end
	
	function self:Check(x)
		if os.clock() - Time > x then
			return true
		end
		return false
	end
	
	return self 
end

return Module
