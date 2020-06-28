--[[ I'm aware that this is some proper shitty code, i really couldn't be bothered to learn classes for-
        lua seeing as i really do hate lua... Why would you use a prototype language!?!?! >:C
    ]]
function onTick()
    -- Grab the variable inputs from the game
    local toggleClutch = input.getNumber(1)
    local clutchValue = input.getNumber(2)
    local gearTotalAmount = input.getNumber(3)
    local gearSelected = input.getNumber(4)

    local clutchEnabled = true

    -- Reset gear selection once. Should do class, but fuck that, Lua doesn't properly support it, ueh!?
    output.setBool(1, false)
    output.setBool(2, false)
    output.setBool(3, false)
    output.setBool(4, false)
    output.setBool(5, false)
    output.setBool(6, false)
    output.setBool(7, false)

    --[[ OUTPUT REFERENCE | TOTAL OF 8 GEARS + REVERSE + NUTREAL (10)
    Bool 1      |   3:2
    Bool 2      |   3:2
    Bool 3      |   9:5
    Bool 4      |   9:5
    Bool 5      |   1:-1 (Reverse)
    Bool 6      |   3:1 (High Gear)
    Bool 7      |   Clutch State
    Number 1    |   Toggle Clutch 0-1
    Number 2    |   Clutch Value
    Number 3    |   Total Configurable Gear Amount
    Number 4    |   Selected Gear
    --]]

    -- Clamp that fucker | Don't need this anymore (Keeping it to be sure)
    if gearSelected > gearTotalAmount then
        --gearSelected = gearTotalAmount
    end

    -- Time for some shitty code again, man, i miss the switch() method... :c

    -- Reverse Gear
    if gearSelected == -1 then
        output.setBool(5, true)
    end

    -- Second Gear
    if gearSelected == 2 then
        output.setBool(1, true)
    end

    -- Third Gear
    if gearSelected == 3 then
        output.setBool(3, true)
    end

    -- Fourth Gear
    if gearSelected == 4 then
        output.setBool(1, true)
        output.setBool(2, true)
    end

    -- Fifth Gear
    if gearSelected == 5 then
        output.setBool(1, true)
        output.setBool(3, true)
    end

    -- Sixth Gear
    if gearSelected == 6 then
        output.setBool(3, true)
        output.setBool(4, true)
    end

    -- Seventh Gear
    if gearSelected == 7 then
        output.setBool(1, true)
        output.setBool(2, true)
        output.setBool(3, true)
    end

    -- Eighth Gear
    if gearSelected == 8 then
        output.setBool(1, true)
        output.setBool(2, true)
        output.setBool(3, true)
        output.setBool(4, true)
    end

    -- Set the clutch and value of clutch, clutch dem fuckers
    if gearSelected == 0 or toggleClutch == 0 then
        clutchValue = 0.123
        clutchEnabled = false
    end

    -- Send out last remaining data, this can be changed outside of gears.
    --      Allows for doing variable clutching, how you know... do in manual cars. You do know how to drive a manual? Right? -._
    output.setBool(7, clutchEnabled)
    output.setNumber(2, clutchValue)
    output.setNumber(3, gearTotalAmount)
    output.setNumber(4, gearSelected)
end