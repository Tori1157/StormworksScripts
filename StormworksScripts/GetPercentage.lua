function onTick()
	local value = input.getNumber(1)
	local percentage = input.getNumber(2)
	
	output.setNumber(1, getPercentage(value, percentage))
end

function getPercentage(value, percentage)
	return value * (percentage / 100)
end