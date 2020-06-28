function onTick()
    local gearUp = input.getNumber(1)
    local gearDown = input.getNumber(2)
    local resetSignal = input.getNumber(3)
    local gearTotalAmount = input.getNumber(4)
    local currentGear = input.getNumber(5)

    local down = false
    local up = false
    local signal = false

    -- I really hate lua
    if gearUp == 1 and currentGear ~= gearTotalAmount then up = true end
    if gearDown == 1 then down = true end
    if resetSignal == 1 then signal = true end

    output.setBool(1, up)
    output.setBool(2, down)
    output.setBool(3, signal)
    output.setNumber(1, gearTotalAmount)
end