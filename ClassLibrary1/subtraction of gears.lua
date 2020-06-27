function onTick()
    local selectedGear = input.getNumber(1)
    
    if selectedGear > 7 then
        selectedGear = -1
    end
    
    output.setNumber(1, selectedGear)
end
