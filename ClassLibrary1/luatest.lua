local GearSelected = 0

function DoShit()
    local ourshit = 202

    if GearSelected == 0 then
        print("Damn thingy is zero, slapping something on it!")
        GearSelected = 1
    end

    print("New numberino: "..GearSelected)


    if GearSelected == 1 then
        print("nonono, we bihg")
        GearSelected = ourshit
        print("Now it hut: " .. GearSelected)
    end
end