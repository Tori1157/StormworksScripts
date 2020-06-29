function onTick()
    local value = input.getNumber(1)
    local svar = false

    if value == 1 then svar = true end

	output.setBool(1, svar)
end
