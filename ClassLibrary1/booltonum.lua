function onTick()
    local value = input.getBool(1)
    local svar = 0

    if value then svar = 1 end

	output.setNumber(1, svar)
end
