function onTick()
	for i = 4, 1, -1 do
		local num = property.getNumber("Input #"..i)
		
		if num == 0 then return end
		
		local inp = input.getBool(num)

		if inp ~= true then
			output.setBool(num, true)
		end
	end
end