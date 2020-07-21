cutoffStarted = false

-- Get all the properties of the MicroController once.
usePlayerClutchInput = property.getBool("Player Controlled Clutch")
rpsThreshold = property.getNumber("RPS Threshold")
idleThrottle = property.getNumber("Idle Throttle")
idleRpsTarget = property.getNumber("Idle RPS Target")
engineTempCutoff = property.getNumber("Engine Temperature Cutoff")
clutchMulti = property.getNumber("Clutch Multiplication")

function onTick()
	local throttle = input.getNumber(1)
	local engineRps = input.getNumber(2)
	local clutch = input.getNumber(3)
	local engineTemp = input.getNumber(4)
	local waterLevel = input.getNumber(5)
	local key = input.getBool(1)

	-- Put engine to IDLE THROTTLE value if THROTTLE INPUT is lower than config.
	if throttle < idleThrottle then throttle = idleThrottle
	elseif throttle > 1.0 then throttle = 1.0 end

	-- Set the clutch
	if not usePlayerClutchInput then
		-- Making sure we're above IDLE THROTTLE limit.
		if throttle > idleThrottle then
			-- Get a little smoother transition.
			clutch = throttle * clutchMulti
		else clutch = 0.0 end
	end

	-- Clamp clutch
	if clutch < 0.0 then clutch = 0.0
	elseif clutch > 1.0 then clutch = 1.0 end

	-- Default values
	if not key then
		output.setBool(1, false)
		output.setNumber(1, 0.0)
		output.setNumber(2, 0.0)
		return
	end

	-- Check Temperature and Water Levels
	if engineTemp >= engineTempCutoff or waterLevel <= -1 then
		-- Cutoff engines
		cutoffStarted = true
		output.setBool(1, false)
		output.setBool(2, true)
		output.setNumber(1, 0.0)
		return
		
	-- Restart engines
	elseif engineTemp < engineTempCutoff and cutoffStarted then
		cutoffStarted = false
		output.setNumber(1, throttle)
		output.setBool(2, false)
	end

	-- RPS too low, start engines
	if engineRps < rpsThreshold then
		output.setBool(1, true)
		output.setNumber(1, 1)
		return
	-- Start engine, keep that sucker alive.
	else output.setBool(1, false) end

	-- Idle RPS too High, decrease throttle & cutoff engines.
	if engineRps > idleRpsTarget and clutch < 0.2 and throttle <= idleThrottle then
		output.setBool(1, false)
		output.setNumber(1, 0.0)
		output.setNumber(2, clutch)
		return
	end

	-- Idle RPS too low, increase throttles
	if engineRps < (idleRpsTarget - 5) and throttle <= idleThrottle then
		output.setNumber(1, 0.5)
	-- Output player throttle input
	else output.setNumber(1, throttle) end
	
	output.setNumber(2, clutch)
end