-- Tick function that will be executed every logic tick
function onTick()
    gear = input.getNumber(1)
    clutchDelay = input.getNumber(2)
    gearSpeed = input.getNumber(3)
    
    -- Reverse
    if gear == 1 then
        
        output.setNumber(1, gear)
       --output.setNumber(2, 1)
        return
    end
    
    -- Nuteral
    if (gear == 2) then
        output.setNumber(2, 0)
        return
    end
    
    -- First
    if (gear == 3) then
        output.setNumber(3, gear)
        --output.setNumber(2, 1)
        return
    end
    
    -- Second
    if (gear == 4) then
        output.setNumber(4, gear)
        --output.setNumber(2, 1)
        return
    end
    
    -- Third
    if (gear == 5) then
        output.setNumber(5, gear)
        --output.setNumber(2, 1)
        return
    end
    
    -- Fourth
    if (gear == 6) then
        output.setNumber(6, gear)
        --output.setNumber(2, 1)
        return
    end
end