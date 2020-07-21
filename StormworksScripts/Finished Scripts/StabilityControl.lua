listenBool = property.getNumber("Bool Listen")
cutoffSteering = property.getNumber("Steering Cutoff")

function onTick()
	timer.start()
	local doStability = input.getBool(listenBool)
	local tilt = input.getNumber(1)
	local steering = math.abs(input.getNumber(2))
	
	local comp = 0

	if not doStability then
		comp = 0
	elseif steering > cutoffSteering then
		comp = tilt * 2
	end
	
	output.setNumber(1, comp)
end