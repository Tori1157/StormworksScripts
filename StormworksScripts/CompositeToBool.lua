function onTick()
	local doTooltip = property.getBool("Toggle Tooltip")

	for i = 16, 1, -1 do
		local boolInput = input.getBool(i)

		if doTooltip then
			local newNum = Switch(i)
			output.setBool(newNum, boolInput)
		end
		
		output.setBool(i, boolInput)
	end
end

-- Using a table is 600% faster then doing 16 + i.
function Switch(number)
	local switchNums = {
	[1] = 17,
	[2] = 18,
	[3] = 19,
	[4] = 20,
	[5] = 21,
	[6] = 22,
	[7] = 23,
	[8] = 24,
	[9] = 25,
	[10] = 26,
	[11] = 27,
	[12] = 28,
	[13] = 29,
	[14] = 30,
	[15] = 31,
	[16] = 32
	}

	for key, value in ipairs(switchNums) do
		if key == number then return value end
	end
	
	-- Default, faster to send back same num than nil
	return number
end
