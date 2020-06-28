local GearSelected = 0
local ClutchAmount = 0.0

--[[ I'm aware that this is some proper shitty code, i really couldn't be bothered to learn classes for-
        lua seeing as i really do hate lua... Why would you use a prototype language!?!?! >:C
    ]]
function onTick()
    -- Grab the variable inputs from the game
    local highLowSelect = input.getNumber(1)
    local toggleClutch = input.getNumber(2)
    local clutchAmount = input.getNumber(3)
    local gearTotalAmount = input.getNumber(4)
    local gearSelected = input.getNumber(5)

    local ratioBool = false

    -- Reset gear selection once. Should do class, but fuck that, Lua doesn't properly support it, ueh!?
    output.setBool(1, false)
    output.setBool(2, false)
    output.setBool(3, false)
    output.setBool(4, false)
    output.setBool(5, false)
    output.setBool(6, false)
    output.setBool(7, false)
    output.setBool(8, false)
    output.setBool(9, false)

    --[[ OUTPUT REFERENCE
    Bool 1      |   Activate Clutch AKA "Gear One"
    Bool 2      |   6:5 Ratio (1)
    Bool 3      |   6:5 Ratio (2)
    Bool 4      |   6:5 Ratio (3)
    Bool 5      |   3:2 Ratio (1)
    Bool 6      |   3:2 Ratio (2)
    Bool 7      |   9:5 Ratio (1)
    Bool 8      |   1:-1 Ratio (Reverse)
    Bool 9      |   2:1 Ratio (High Gear)
    Number 1    |   High Gear Number 0-1 (?)
    Number 2    |   Toggle Clutch 0-1 (?)
    Number 3    |   Clutch Amount 0.0-1
    Number 4    |   Total Configurable Gear Amount
    Number 5    |   Selected Gear
    --]]

    -- Clamp that fucker
    if gearSelected > gearTotalAmount then
        gearSelected = gearTotalAmount
    end

    -- Did i mention i hate lua? Anyway, converting the converted bool to num, too bool... Yeaah... Damn game mechanics :/
    if highLowSelect == 1 then ratioBool = true
    elseif highLowSelect == 0 then ratioBool = false
    end

    -- Time for some shitty code again, man, i miss the switch() method... :c

    -- Reverse Gear
    if gearSelected == -1 then
        output.setBool(8, true)
    end

    -- First Gear
    if gearSelected == 1 then
        output.setBool(1, true)
    end

    -- Second Gear
    if gearSelected == 2 then
        output.setBool(2, true)
    end

    -- Third Gear
    if gearSelected == 3 then
        output.setBool(2, true)
        output.setBool(3, true)
    end

    -- Fourth Gear
    if gearSelected == 4 then
        output.setBool(5, true)
    end

    -- Fifth Gear
    if gearSelected == 5 then
        output.setBool(2, true)
        output.setBool(3, true)
        output.setBool(4, true)
    end

    -- Sixth Gear
    if gearSelected == 6 then
        output.setBool(5, true)
        output.setBool(1, true)
    end

    -- Seventh Gear
    if gearSelected == 7 then
        output.setBool(7, true)
    end

    -- Eighth Gear
    if gearSelected == 8 then
        output.setBool(1, true)
        output.setBool(2, true)
        output.setBool(5, true)
    end

    -- Ninth Gear
    if gearSelected == 9 then
        output.setBool(5, true)
        output.setBool(6, true)
    end

    -- Tenth Gear
    if gearSelected == 10 then
        output.setBool(5, true)
        output.setBool(6, true)
        output.setBool(1, true)
    end

    -- Set the clutch and value of clutch, clutch dem fuckers
    if gearSelected == 0 or toggleClutch == 0 then
        clutchAmount = 0.0
    end

    -- Send out last remaining data, this can be changed outside of gears.
    --      Allows for doing variable clutching, how you know... do in manual cars. You do know how to drive a manual? Right? -._
    output.setBool(9, ratioBool)
    output.setNumber(3, clutchAmount)
    output.setNumber(5, gearSelected)
end