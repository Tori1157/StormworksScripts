--[[
	QUOTE:
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 

	Yeah, so, this controller is utter garbage. I tried to walk around the game mechanics, but Stormworks
	has a hardcoded LERP function on seat controls, so me trying to fuck with it by feeding it other numbers
	does not work. Perhaps with a THROTTLE entity, but i can't be fucked.

||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
	END QUOTE
	
	It works as long as you don't need decimals precision in the lower ends of ~0.1,
	code is crude as fuck, can't be fucked to clean it seeing as this is dumped and only left alone for references.
]]--




-- Our value
main = 40
-- The closet to 0.00 the closer to original number. (max to 1)
t = 0.25

function test()
	local minValue = 20.0
	local maxValue  = 80.0
	local increment = 1
	
	print("MIDDLE: ".. middle(minValue, maxValue))
	print("CHANGED: " .. change(main, minValue, maxValue, increment, t))
end

function change(value, minValue, maxValue, increment, tx)
	-- Lua shit, Stormworks weird, need to compensate for values like 0.9999999999
	if math.ceil(value) == maxValue then
		local kek = twoDecimals(value)
		
		if kek == (maxValue-0.01) then
			return maxValue
		end
	end
	
	-- If the input value is below minimum value
	if value < minValue then
		return minValue
	end

	-- If the input value is above maximum value
	if value > maxValue then
		return maxValue
	end

	local mid = middle(minValue, maxValue)

	-- Don't want to do math on base value
	if value == mid then
		return value
	end

	local meth = twoDecimals(value - ((maxValue - value) + increment) * tx)

	-- If results are below middle and it's supposed to be above.
	if meth < mid and value > mid then
		return math.abs(meth)
	end

	-- If results are above middle and it's suppose to be below
	if meth > mid and value < mid then
		return -meth
	end
	
	-- default
	return meth
end

-- Do some fancy math that my shitty brain could not handle, thanks Dexon for math help. <3
function middle(min, max)
	-- Don't want the numbers to do crazy shit
	if min > max then
		return 0.0
	end

	return (max + min) * 0.5
end

-- This one is a beauty, eh?
function twoDecimals(value)
	-- That's right. Convert integer to string, then convert string to integer.
		-- Best i could do *shrugs* (strongly dislike lua)
	return tonumber(string.format("%2.2f", value))
end

function removeDecimals(value)
	return tonumber(string.format("%2.0f", value))
end 