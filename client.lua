dataReturn = nil 
opened = false 

RegisterNUICallback("complete", function()
    SetNuiFocus(false, false)
    dataReturn = true
    opened = false 
end)

RegisterCommand("testzzz", function()
   local test = exports['np-repairskill']:skillbar(40)
   print(test)
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
    dataReturn = false
    opened = false 
end)

function skillbar(time)
    if opened then return false end -- alr opened
    dataReturn = nil
    opened = true 
    SendNUIMessage({
        action = "start",
        time = time
    })

    SetNuiFocus(true, false)
    while dataReturn == nil do 
        Wait(100)
    end

    return dataReturn
end

exports('skillbar', skillbar)