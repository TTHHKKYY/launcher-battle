return function(Origin,Look,Ignore,Whitelist)
	local Arguments = RaycastParams.new()
	local Result
	
	if type(Ignore) == "table" then
		Arguments.FilterDescendantsInstances = Ignore
	else
		Arguments.FilterDescendantsInstances = {Ignore}
	end
	if Whitelist then
		Arguments.FilterType = Enum.RaycastFilterType.Whitelist
	else
		Arguments.FilterType = Enum.RaycastFilterType.Blacklist
	end
	
	Result = workspace:Raycast(Origin,Look,Arguments)
	
	if Result then
		return {Part = Result.Instance,Hit = Result.Position,Normal = Result.Normal,Material = Result.Material}
	end
	return {}
end
