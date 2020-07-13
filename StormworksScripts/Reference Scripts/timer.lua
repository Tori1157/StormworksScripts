function onTick()
	local input = input.getBool(1)
	local toggle = input.getBool(2)

	if toggle and not input then
		output.setBool(2, true)
		return
	end

	if toggle and input then
		output.setBool()
	end
end