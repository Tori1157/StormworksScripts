hasInitialized = false
switchTable = {}
tableKeys = 32
lastPress = 0

useAll = property.getBool("Use 32 Booleans")

function onTick()
	if not hasInitialized then Initialization() end

	-- Iterate through inputs
	for i = tableKeys, 1, -1 do
		local sniff = input.getBool(i)

		-- Button Press & New button
		if sniff and i ~= lastPress then
			local f = switchTable[i]

			-- Set new value, doubles as init table insert
			switchTable[i] = not f
			lastPress = i
			-- Reset, button not being pressed anymore.
		elseif not sniff and i == lastPress then
			lastPress = 0
		end

		-- Send out booleans from tableKeys
		output.setBool(i, switchTable[i])
	end
	output.setNumber(1, tableKeys)
end

-- Set default values
function Initialization()
	local pos = 1

	-- Runs infinitely in game, because non existent bools return false,
	-- so the break on line 45 does nothing. And with that, i bid farewell... For now. Back to C# we go.
	while true do
		local p = property.getBool("Default Output #"..pos)

		-- Property non-existent, break loop.
		if p == nil then
			pos = pos - 1
			break
		end

		-- Insert default values to table
		switchTable[#switchTable + pos] = p
		pos = pos + 1
	end

	-- Set bool amount
	if not useAll then
		tableKeys = pos end

	hasInitialized = true
end