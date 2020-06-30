function onTick()
	local value = input.getNumber(1)
	local threshold = input.getNumber(2)

	if value < threshold then
		output.setBool(1, true)
	else
		output.setBool(1, false)
	end
end