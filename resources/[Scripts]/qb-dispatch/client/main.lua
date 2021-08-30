local Framework = nil

Citizen.CreateThread(function()
    while Framework == nil do
        TriggerEvent("Framework:GetObject", function(obj) Framework = obj end)
        Citizen.Wait(0)
    end
end)

local currentPlate = ""
local currentType = 0

local job = ""
local grade = 0

local unitCooldown = false
local alertsToggled = true
local unitBlipsToggled = true
local callBlipsToggled = true

local callBlips = {}
local blips = {}

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    local PlayerData = Framework.Functions.GetPlayerData()
    job = PlayerData.job.name
    grade = PlayerData.job.grades

    local jobInfo = {}

    jobInfo[Config.JobOne.job] = {
        color = Config.JobOne.color,
        column = 1,
        label = Config.JobOne.label,
        canRequestLocalBackup = Config.JobOne.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobOne.canRequestOtherJobBackup,
        forwardCall = Config.JobOne.forwardCall,
        canRemoveCall = Config.JobOne.canRemoveCall
    }
    jobInfo[Config.JobTwo.job] = {
        color = Config.JobTwo.color,
        column = 2,
        label = Config.JobTwo.label,
        canRequestLocalBackup = Config.JobTwo.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobTwo.canRequestOtherJobBackup,
        forwardCall = Config.JobTwo.forwardCall,
        canRemoveCall = Config.JobTwo.canRemoveCall
    }
    jobInfo[Config.JobThree.job] = {
        color = Config.JobThree.color,
        column = 3,
        label = Config.JobThree.label,
        canRequestLocalBackup = Config.JobThree.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobThree.canRequestOtherJobBackup,
        forwardCall = Config.JobThree.forwardCall,
        canRemoveCall = Config.JobThree.canRemoveCall
    }
    Framework.Functions.TriggerCallback("qb-dispatch:getPersonalInfo", function(firstname, lastname)
        SendNUIMessage({
            type = "Init",
            firstname = firstname,
            lastname = lastname,
            jobInfo = jobInfo
        })
    end)
end)


RegisterNetEvent("Framework:Client:OnJobUpdate")
AddEventHandler("Framework:Client:OnJobUpdate", function(JobInfo)
    job = JobInfo.name
    grade = JobInfo.grades

    local jobInfo = {}

    jobInfo[Config.JobOne.job] = {
        color = Config.JobOne.color,
        column = 1,
        label = Config.JobOne.label,
        canRequestLocalBackup = Config.JobOne.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobOne.canRequestOtherJobBackup,
        forwardCall = Config.JobOne.forwardCall,
        canRemoveCall = Config.JobOne.canRemoveCall
    }
    jobInfo[Config.JobTwo.job] = {
        color = Config.JobTwo.color,
        column = 2,
        label = Config.JobTwo.label,
        canRequestLocalBackup = Config.JobTwo.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobTwo.canRequestOtherJobBackup,
        forwardCall = Config.JobTwo.forwardCall,
        canRemoveCall = Config.JobTwo.canRemoveCall
    }
    jobInfo[Config.JobThree.job] = {
        color = Config.JobThree.color,
        column = 3,
        label = Config.JobThree.label,
        canRequestLocalBackup = Config.JobThree.canRequestLocalBackup,
        canRequestOtherJobBackup = Config.JobThree.canRequestOtherJobBackup,
        forwardCall = Config.JobThree.forwardCall,
        canRemoveCall = Config.JobThree.canRemoveCall
    }
    Framework.Functions.TriggerCallback("qb-dispatch:getPersonalInfo", function(firstname, lastname)
        SendNUIMessage({
            type = "Init",
            firstname = firstname,
            lastname = lastname,
            jobInfo = jobInfo
        })
    end)
end)

RegisterKeyMapping(Config.OpenMenuCommand, "Open Dispach using " .. Config.OpenMenuKey, "keyboard", Config.OpenMenuKey)

RegisterCommand(Config.OpenMenuCommand, function()
    openDispach()
end, false)

RegisterCommand(Config.JobOne.callCommand, function(source, args, rawCommand)
    local msg = rawCommand:sub(5)
    local cord = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("qb-dispatch:addMessage", msg, {cord[1], cord[2], cord[3]}, Config.JobOne.job, 5000, Config.callCommandSprite, Config.callCommandColor)
end, false)

RegisterCommand(Config.JobTwo.callCommand, function(source, args, rawCommand)
    local msg = rawCommand:sub(5)
    local cord = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("qb-dispatch:addMessage", msg, {cord[1], cord[2], cord[3]}, Config.JobTwo.job, 5000, Config.callCommandSprite, Config.callCommandColor)
end, false)

RegisterCommand(Config.JobThree.callCommand, function(source, args, rawCommand)
    local msg = rawCommand:sub(5)
    local cord = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("qb-dispatch:addMessage", msg, {cord[1], cord[2], cord[3]}, Config.JobThree.job, 5000, Config.callCommandSprite, Config.callCommandColor)
end, false)

function addBlipForCall(sprite, color, coords, text)
    local alpha = 250
    local radius = AddBlipForRadius(coords, 40.0)
    local blip = AddBlipForCoord(coords)

    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.3)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, false)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(tostring(text))
    EndTextCommandSetBlipName(blip)

    SetBlipHighDetail(radius, true)
    SetBlipColour(radius, color)
    SetBlipAlpha(radius, alpha)
    SetBlipAsShortRange(radius, true)

    table.insert(callBlips, blip)
    table.insert(callBlips, radius)

    while alpha ~= 0 do
        Citizen.Wait(Config.CallBlipDisappearInterval)
        alpha = alpha - 1
        SetBlipAlpha(radius, alpha)

        if alpha == 0 then
            RemoveBlip(radius)
            RemoveBlip(blip)
         
            return
        end
    end
end

function addBlipsForUnits()
    Framework.Functions.TriggerCallback("qb-dispatch:getUnits", function(units)
        local id = GetPlayerServerId(PlayerId())

        for _, z in pairs(blips) do
            RemoveBlip(z)
        end

        blips = {}

        for k, v in pairs(units) do
            if
                k ~= id and
                    (Config.JobOne.job == v.job or Config.JobTwo.job == v.job or Config.JobThree.job == v.job)
                then
                local color = 0
                local title = ""
                if Config.JobOne.job == v.job then
                    color = Config.JobOne.blipColor
                    title = Config.JobOne.label
                end
                if Config.JobTwo.job == v.job then
                    color = Config.JobTwo.blipColor
                    title = Config.JobTwo.label
                end
                if Config.JobThree.job == v.job then
                    color = Config.JobThree.blipColor
                    title = Config.JobThree.label
                end

                local new_blip = AddBlipForEntity(NetworkGetEntityFromNetworkId(v.netId))

                SetBlipSprite(new_blip, Config.Sprite[v.type])
                ShowHeadingIndicatorOnBlip(new_blip, true)
                HideNumberOnBlip(new_blip)
                SetBlipScale(new_blip, 0.7)
                SetBlipCategory(new_blip, 7)
                SetBlipColour(new_blip, color)
                SetBlipAsShortRange(new_blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("(" .. title .. ") " .. v.firstname .. " " .. v.lastname)
                EndTextCommandSetBlipName(new_blip)

                blips[k] = new_blip
            end
        end
    end)
end

function openDispach()
    if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
        SetNuiFocus(false, false)
        Framework.Functions.TriggerCallback("qb-dispatch:getInfo", function(units, calls, ustatus)
            SetNuiFocus(true, true)
            SendNUIMessage({
                type = "open",
                units = units,
                calls = calls,
                ustatus = ustatus,
                job = job,
                id = GetPlayerServerId(PlayerId())
            })
        end)
    end
end




RegisterNetEvent("qb-dispatch:callAdded")
AddEventHandler("qb-dispatch:callAdded", function(id, call, j, cooldown, sprite, color)
    if job == j and alertsToggled then
        SendNUIMessage({
            type = "call",
            id = id,
            call = call,
            cooldown = cooldown
        })

        if Config.AddCallBlips then
            addBlipForCall(sprite, color, vector3(call.coords[1], call.coords[2], call.coords[3]), id)
        end
    end
end)

RegisterNUICallback( "dismissCall", function(data)
    local id = data["id"]:gsub("call_", "")

    TriggerServerEvent("qb-dispatch:unitDismissed", id)
    DeleteWaypoint()
end)

RegisterNUICallback("updatestatus", function(data)
    local id = data["id"]
    local status = data["status"]

    TriggerServerEvent("qb-dispatch:changeStatus", id, status)
end)

RegisterNUICallback("sendnotice", function(data)
    local caller = data["caller"]

    if Config.EnableUnitArrivalNotice then
        TriggerServerEvent("qb-dispatch:arrivalNotice", caller)
    end
end)

RegisterNetEvent("qb-dispatch:arrivalNotice")
AddEventHandler("qb-dispatch:arrivalNotice", function()
    if not unitCooldown then
        Framework.Functions.Notify(Config.Text["someone_is_reacting"])
        unitCooldown = true
        Citizen.Wait(20000)
        unitCooldown = false
    end
end)

RegisterNUICallback("reqbackup", function(data)
    local j = data["job"]
    local req = data["requester"]
    local firstname = data["firstname"]
    local lastname = data["lastname"]
    Framework.Functions.Notify(Config.Text["backup_requested"])
    local cord = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("qb-dispatch:addCall", "00-00", req .. " is requesting help", {{icon = "fa-user-friends", info = firstname .. " " .. lastname}}, {cord[1], cord[2], cord[3]}, j)
end)

RegisterNUICallback("toggleoffduty", function(data)
    Framework.Functions.Notify("You are now off duty", "error")
end)

RegisterNUICallback("togglecallblips", function(data)
    callBlipsToggled = not callBlipsToggled

    if callBlipsToggled then
        for _, z in pairs(callBlips) do
            SetBlipDisplay(z, 4)
        end
        Framework.Functions.Notify(Config.Text["call_blips_turned_on"])
    else
        for _, z in pairs(callBlips) do
            SetBlipDisplay(z, 0)
        end

        Framework.Functions.Notify(Config.Text["call_blips_turned_off"])
    end
end)

RegisterNUICallback("toggleunitblips", function(data)
    unitBlipsToggled = not unitBlipsToggled

    if unitBlipsToggled then
        addBlipsForUnits()
        Framework.Functions.Notify(Config.Text["unit_blips_turned_on"])
    else
        for _, z in pairs(blips) do
            RemoveBlip(z)
        end

        blips = {}
        Framework.Functions.Notify(Config.Text["unit_blips_turned_off"])
    end
end)

RegisterNUICallback("togglealerts", function(data)
    alertsToggled = not alertsToggled

    if alertsToggled then
        Framework.Functions.Notify(Config.Text["alerts_turned_on"])
    else
        Framework.Functions.Notify(Config.Text["alerts_turned_off"])
    end
end)

RegisterNUICallback("copynumber", function(data)
    Framework.Functions.Notify(Config.Text["phone_number_copied"])
end)

RegisterNUICallback("forwardCall",
function(data)
    local id = data["id"]:gsub("call_", "")

    Framework.Functions.Notify(Config.Text["call_forwarded"])
    TriggerServerEvent("qb-dispatch:forwardCall", id, data["job"])
end)

RegisterNUICallback("acceptCall", function(data)
    local id = data["id"]:gsub("call_", "")

    SetNewWaypoint(tonumber(data["x"]), tonumber(data["y"]))

    TriggerServerEvent("qb-dispatch:unitResponding", id, job)
end)

RegisterNUICallback("removeCall", function(data)
    local id = data["id"]:gsub("call_", "")
    Framework.Functions.Notify(Config.Text["call_removed"])
    TriggerServerEvent("qb-dispatch:removeCall", id)
end)

RegisterNUICallback("close",
function(data)
    SetNuiFocus(false, false)
end)

--Shots in area
Citizen.CreateThread(function()
    while Config.EnableShootingAlerts do
        Citizen.Wait(10)
        local whithin = false
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)

        for _, v in ipairs(Config.ShootingZones) do
            local distance = #(playerPos - v.coords)
            if distance < v.radius then
                whithin = true
            end
        end

        if whithin then

        
            if IsPedShooting(ped) and math.random(1, 2) == 1 then
                local gender = "unknown"
                local model = GetEntityModel(ped)
                charGender = Framework.Functions.GetPlayerData().charinfo.gender
                if charGender == 2 then
                    gender = "female"
                end
                if charGender == 1 then
                    gender = "male"
                end

                TriggerServerEvent("qb-dispatch:addCall", "10-71", "Shots in area", {{icon = "fa-venus-mars", info = gender}}, {playerPos[1], playerPos[2], playerPos[3]}, "police", 5000, 156, 1)
                Citizen.Wait(20000)
            end
        else
            Citizen.Wait(2000)
        end
    end
end)

Citizen.CreateThread(function()
    while Config.EnableMapBlipsForUnits do
        if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
            if unitBlipsToggled then
                addBlipsForUnits()
            end
        end

        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()
    while true do
        status = {
            carPlate = currentPlate,
            type = currentType,
            job = job,
            netId = NetworkGetNetworkIdFromEntity(PlayerPedId())
        }

        TriggerServerEvent("qb-dispatch:playerStatus", status)

        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= nil then
            local plate = GetVehicleNumberPlateText(vehicle)
            if plate ~= nil then
                currentPlate = plate
                currentType = GetVehicleClass(vehicle)
            else
                currentPlate = ""
            end
        end

        Citizen.Wait(0)
    end
end)

--EXPORTS

exports("addCall",function(code, title, extraInfo, coords, job, cooldown, sprite, color)
    TriggerServerEvent("qb-dispatch:addCall", code, title, extraInfo, coords, job, cooldown or 5000, sprite or 11, color or 5)
end)

exports("addMessage", function(message, coords, job, cooldown, sprite, color)
    TriggerServerEvent("qb-dispatch:addMessage", message, coords, job, sprite, cooldown or 5000, sprite or 11, color or 5)
end)
