function onTick()
    local clutchAmount = input.getNumber(1)
    local gearSelected = input.getNumber(2)

    -- Ugly as fuck, but need to cleanup the gears, also i hate lua, so idgaf
    -- But if we could do C#.... uwu
    output.setBool(1, false)
    output.setBool(2, false)
    output.setBool(3, false)
    output.setBool(4, false)
    output.setBool(5, false)
    output.setBool(6, false)
    output.setBool(7, false)

    -- Reverse
    if gearSelected == -1 then
        output.setBool(7, true)
    end

    -- First
    if gearSelected == 1 then
        output.setBool(1, true)
        output.setNumber(1, clutchAmount)
        return;
    end

    -- Second
    if gearSelected == 2 then
        output.setBool(1, true)
        output.setBool(2, true)
    end

    -- Third
    if gearSelected == 3 then
        output.setBool(1, true)
        output.setBool(2, true)
        output.setBool(3, true)
    end

    -- Fourth
    if gearSelected == 4 then
        output.setBool(1, true)
        output.setBool(2, true)
        output.setBool(3, true)
        output.setBool(4, true)
    end

    -- Fifth
    if gearSelected == 5 then
        output.setBool(1, true)
        output.setBool(2, true)
        output.setBool(3, true)
        output.setBool(4, true)
        output.setBool(5, true)
    end

    -- Sixth
    if gearSelected == 6 then
        output.setBool(1, true)
        output.setBool(2, true)
        output.setBool(3, true)
        output.setBool(4, true)
        output.setBool(5, true)
        output.setBool(6, true)
    end

    -- Set the clutch and value of clutch, clutch dem fuckers
    if gearSelected == 0 then
        output.setNumber(1, 0.0)
    else
        output.setNumber(1, clutchAmount)
    end
    
    output.setBool(10, true)
end