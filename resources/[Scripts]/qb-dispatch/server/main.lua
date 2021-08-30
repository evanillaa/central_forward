Framework = nil
TriggerEvent("Framework:GetObject", function(obj) Framework = obj end) 

Id = 0

Units = {}
Calls = {}
UnitStatus = {}


RegisterServerEvent("qb-dispatch:playerStatus")
AddEventHandler("qb-dispatch:playerStatus", function(status)
    local src = source

    if status.carPlate ~= "" then
        Units[src] = {plate = status.carPlate, type = status.type, job = status.job, netId = status.netId}
    else
        Units[src] = nil
    end
end)

RegisterServerEvent("qb-dispatch:removeCall")
AddEventHandler("qb-dispatch:removeCall", function(id)
    Calls[tonumber(id)] = nil
end)

RegisterServerEvent("qb-dispatch:changeStatus")
AddEventHandler("qb-dispatch:changeStatus", function(userid, status)
    UnitStatus[userid] = status
end)

RegisterServerEvent("qb-dispatch:unitDismissed")
AddEventHandler("qb-dispatch:unitDismissed", function(id, job)
    local src = source
    local count = 1

    for _, v in ipairs(Calls[tonumber(id)].respondingUnits) do
        if v.unit == src then
            table.remove(Calls[tonumber(id)].respondingUnits, count)
        end
        count = count + 1
    end
end)

RegisterServerEvent("qb-dispatch:unitResponding")
AddEventHandler("qb-dispatch:unitResponding", function(id, job)
    local src = source
    table.insert(Calls[tonumber(id)].respondingUnits, {unit = src, type = job})
end)

RegisterServerEvent("qb-dispatch:forwardCall")
AddEventHandler("qb-dispatch:forwardCall", function(id, job)
    local add = true
    for _, v in ipairs(Calls[tonumber(id)].job) do
        if v == job then
            add = false
        end
    end

    if add then
        table.insert(Calls[tonumber(id)].job, job)

        TriggerClientEvent("qb-dispatch:callAdded", -1, tonumber(id), Calls[tonumber(id)], job, 5000)
    end
end)

RegisterServerEvent("qb-dispatch:addMessage")
AddEventHandler("qb-dispatch:addMessage", function(message, location, job, cooldown, sprite, color)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    local phone = Player.PlayerData.charinfo.phone
    Calls[Id] = {
        code = "",
        title = "",
        extraInfo = {},
        respondingUnits = {},
        coords = location,
        job = {job},
        phone = phone,
        message = message,
        type = "message",
        caller = src
    }

    TriggerClientEvent("qb-dispatch:callAdded", -1, Id, Calls[Id], job, cooldown or 5000, sprite or 11, color or 5)

    Id = Id + 1
end)

RegisterServerEvent("qb-dispatch:addCall")
AddEventHandler("qb-dispatch:addCall", function(code, title, info, location, job, cooldown, sprite, color)
    Calls[Id] = {
        code = code,
        title = title,
        extraInfo = info,
        respondingUnits = {},
        coords = location,
        job = {job},
        type = "call"
    }

    TriggerClientEvent("qb-dispatch:callAdded", -1, Id, Calls[Id], job, cooldown or 3500, sprite or 11, color or 5)


        Id = Id + 1
end)

RegisterServerEvent("qb-dispatch:arrivalNotice")
AddEventHandler("qb-dispatch:arrivalNotice", function(caller)
    if caller ~= nil then
        TriggerClientEvent("qb-dispatch:arrivalNotice", caller)
    end
end)

Framework.Functions.CreateCallback("qb-dispatch:getPersonalInfo", function(source, cb)
    local Player = Framework.Functions.GetPlayer(source)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname

    cb(firstname, lastname)
end)

Framework.Functions.CreateCallback("qb-dispatch:getInfo", function(source, cb)
    local generated = {}

    for k, v in pairs(Units) do
        if GetPlayerPing(k) > 0 then
            local Player = Framework.Functions.GetPlayer(source)
            local firstname = Player.PlayerData.charinfo.firstname
            local lastname = Player.PlayerData.charinfo.lastname

            if generated[v.plate] == nil then
                generated[v.plate] = {
                    type = Config.Icons[v.type],
                    units = {{id = k, name = firstname .. " " .. lastname}},
                    job = v.job
                }
            elseif generated[v.plate].job == v.job then
                table.insert(generated[v.plate].units, {id = k, name = firstname .. " " .. lastname})
            end
        end
    end
    cb(generated, Calls, UnitStatus)
end)

Framework.Functions.CreateCallback("qb-dispatch:getUnits", function(source, cb)
    local generated = {}

    for k, v in pairs(Units) do
        if GetPlayerPing(k) > 0 then
            local Player = Framework.Functions.GetPlayer(source)
            local firstname = Player.PlayerData.charinfo.firstname
            local lastname = Player.PlayerData.charinfo.lastname

            generated[k] = {netId = v.netId, firstname = firstname, lastname = lastname, type = v.type, job = v.job}
        end
    end
    cb(generated)
end)