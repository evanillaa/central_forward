Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inRange = true

        local LabDist = GetDistanceBetweenCoords(pos, Config.Lab["coords"]["x"], Config.Lab["coords"]["y"], Config.Lab["coords"]["z"], true)

        if LabDist < 15 then
            inRange = true
            if Config.Lab["isOpened"] then
                TriggerServerEvent('qb-doorlock:server:updateState', 119, false)
                --local object = GetClosestObjectOfType(Config.Lab["coords"]["x"], Config.Lab["coords"]["y"], Config.Lab["coords"]["z"], 5.0, Config.Lab["object"], false, false, false)
            
                --if object ~= 0 then
                --    SetEntityHeading(object, Config.BigBanks["paleto"]["heading"].open)
                --end
            else
                TriggerServerEvent('qb-doorlock:server:updateState', 119, true)
                --local object = GetClosestObjectOfType(Config.Lab["coords"]["x"], Config.Lab["coords"]["y"], Config.Lab["coords"]["z"], 5.0, Config.Lab["object"], false, false, false)
            
                --if object ~= 0 then
                --    SetEntityHeading(object, Config.Lab["heading"].closed)
                --end
            end
        end

        if not inRange then
            Citizen.Wait(5000)
        end

        Citizen.Wait(1000)
    end
end)

RegisterNetEvent('qb-humanlabs:client:ClearTimeoutDoors')
AddEventHandler('qb-humanlabs:client:ClearTimeoutDoors', function()
    TriggerServerEvent('qb-doorlock:server:updateState', 121, true)
    local LabObject = GetClosestObjectOfType(Config.Lab["coords"]["x"], Config.Lab["coords"]["y"], Config.Lab["coords"]["z"], 5.0, Config.Lab["object"], false, false, false)
    if LabObject ~= 0 then
        SetEntityHeading(PaletoObject, Config.Lab["heading"].closed)
    end

    for k, v in pairs(Config.Lab["lockers"]) do
        Config.Lab["lockers"][k]["isBusy"] = false
        Config.Lab["lockers"][k]["isOpened"] = false
    end


    Config.Lab["isOpened"] = false
end)
