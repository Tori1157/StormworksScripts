function onTick()
	local total = 0
	
	for i = 15, 1, -1 do
		local add = input.getNumber(i) or 0
		
		total = total + add
	end
	
	output.setNumber(1, total)
end