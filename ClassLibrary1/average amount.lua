function onTick()
    local numbers = {}
    local amount = 0

    -- Iterate through all number inputs
    for k, v in pairs(input.getNumber()) do

        -- Make sure we don't work with nothing...
        if v ~= 0 then
            table.insert(numbers, v)
            amount = amount +1
        end
    end

    local added = 0
    for key, number in pairs(numbers) do
        added = added + number
    end

    local average = amount / added

    if average < 20 then
        output.setNumber(2, 1)
    end

    output.setNumber(1, amount / added)
end