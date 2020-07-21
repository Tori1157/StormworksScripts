hasInitialized = false
switchTable = {
	[1] = false,
	[2] = false,
	[3] = false,
	[4] = false,
	[5] = false,
	[6] = false,
	[7] = false,
	[8] = false,
	[9] = false,
	[10] = false,
	[11] = false,
	[12] = false,
	[13] = false,
	[14] = false,
	[15] = false,
	[16] = false
}

function onTick()
	if not hasInitialized then Initialization() end

	-- Iterate through inputs
	for i = 16, 1, -1 do
		local sniff = input.getBool(i)

		if sniff then
			local b = switchTable[i]

			-- Switch between T or F, worry not input should be single-tick pulse.
			if b then 
				switchTable[i] = false
			else 
				switchTable[i] = true 
			end
		end

		output.setBool(i, switchTable[i])
	end
end

-- Set default values
function Initialization()
	for k, v in ipairs(switchTable) do
		if k == nil then return end
		local prop = property.getBool("Initial Input #"..k) or nil

		if prop ~= nil then
			switchTable[k] = prop
		end
	end

	hasInitialized = true
end