-- Way cleaner, faster and actually works.
function onTick()
    local inputs = property.getNumber("Number Input Amount")
    local threshold = property.getNumber("Disregard Numbers From Under")
    local alarm        = property.getNumber("Alarm Threshold")
    local disableAlarm = input.getBool(1)

    local amount = 0.0
    local usedInputs = 0.0
    local average = 0.0

    for i = inputs, 1, -1 do
        local num = input.getNumber(i)

        if math.abs(num) > threshold then
            amount = amount + num
            usedInputs = usedInputs + 1
        end
    end

    if amount ~= 0.0 then
        average = amount / usedInputs
    end
    
    if average < alarm and not disableAlarm then
        output.setBool(1, true)
    else output.setBool(1, false) end

    output.setNumber(1, average)
end