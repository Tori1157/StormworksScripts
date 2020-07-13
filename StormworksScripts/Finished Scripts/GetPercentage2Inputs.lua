function onTick()
	local staticValue = input.getNumber(1)
	local percentage = input.getNumber(2)
	local variablePercentage = input.getNumber(3)
	local useVariablePercent = input.getNumber(4)
	
	--Note; Do not use a while loop, game does not like it.
	if useVariablePercent == 1 then
		-- Need to clamp it, so that the multiplication later on works as intended
		if variablePercentage < 0 then
			variablePercentage = 0
		elseif variablePercentage > 1 then
			variablePercentage = 1
		end
		
		percentage = variablePercentage * 100
	end
	
	output.setNumber(1, getPercentage(staticValue, percentage))
end

function getPercentage(value, percentage)
	return value * (percentage / 100)
end