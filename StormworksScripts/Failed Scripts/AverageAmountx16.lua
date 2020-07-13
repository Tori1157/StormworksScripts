function onTick()
    local numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}
    local toggleAlarm = input.getNumber(17)
    local maxConfig = input.getNumber(18)
    local minValue = input.getNumber(19)
    local totalAmount = 0

    for key, value in ipairs(numbers) do
        if value > maxConfig then
            return end
        
        local valueIn = input.getNumber(value)

        if valueIn == nil then
            return end
        
        totalAmount = totalAmount + valueIn
    end

    if totalAmount < minValue and toggleAlarm == 0 then
        output.setBool(1, true)
    else
        output.setBool(1, false)
    end

    output.setNumber(1, totalAmount)
end