function onTick()
	local throttle = input.getNumber(1)
	local engineRps = input.getNumber(2)
	local clutch = input.getNumber(3)

	local rpsThreshold = property.getNumber("RPS Threshold")
	local idleThrottle = property.getNumber("Idle Throttle")
	local idleRpsTarget = property.getNumber("Idle RPS Target")
	local useAutoClutch = property.getBool("Individual Clutch Control")
	
	local key = input.getBool(1)

	if throttle < idleThrottle then throttle = idleThrottle
	elseif throttle > 1.0 then throttle = 1.0
	end

	if not useAutoClutch then
		if throttle > idleThrottle then
			clutch = 1.0
		end
	elseif clutch < 0.0 then clutch = 0.0
	elseif clutch > 1.0 then clutch = 1.0
	end

	if key == true then
		if engineRps < rpsThreshold then
			output.setBool(1, true)
			output.setNumber(1, 1.0)
			return
		else
			output.setBool(1, false)
		end

		if engineRps > idleRpsTarget and clutch < 0.2 and throttle <= idleThrottle then
			output.setBool(1, false)
			output.setNumber(1, 0.0)
			output.setNumber(2, clutch)
			return
		end

		if engineRps < (idleRpsTarget - 5) and throttle <= idleThrottle then
			output.setNumber(1, 1.0)
		else output.setNumber(1, throttle) end
		
		output.setNumber(2, clutch)
	else
		output.setBool(1, false)
		output.setNumber(1, 0.0)
		output.setNumber(2, 0.0)
	end
end