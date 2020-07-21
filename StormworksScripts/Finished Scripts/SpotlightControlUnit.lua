rotation = 0
tilt = 0
speed = property.getNumber("Tower Speed")
maxUpAngle = property.getNumber("Max Up Tilt")
maxDownAngle = property.getNumber("Max Down Tilt")

function onTick()
	local doRight       = input.getBool(1)
	local doLeft        = input.getBool(2)
	local doUp          = input.getBool(3)
	local doDown        = input.getBool(4)
	
	local tiltSensor    = input.getNumber(1)
	local compassSensor = input.getNumber(2)
	
	if doRight then
		rotation = -speed
	elseif doLeft then
		rotation = speed
	else rotation = 0 end

	if doUp then
		tilt = speed
	elseif doDown then
		tilt = -speed
	else tilt = 0 end

	if doRight and doLeft then
		rotation = 0
	elseif doDown and doUp then
		tilt = 0
	end

	if doUp and tiltSensor > maxUpAngle then
		tilt = 0
	end
	if doDown and tiltSensor < maxDownAngle then
		tilt = 0
	end
	
	output.setNumber(1, rotation)
	output.setNumber(2, tilt)
end