Framework = nil
TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

local VehicleStatus = {}
local VehicleDrivingDistance = {}

Framework.Functions.CreateCallback('qb-vehicletuning:server:GetDrivingDistances', function(source, cb)
    cb(VehicleDrivingDistance)
end)

Framework.Functions.CreateCallback('vehiclemod:server:setupVehicleStatus', function(source, cb, plate, engineHealth, bodyHealth)
	local src = source
    local engineHealth = engineHealth ~= nil and engineHealth or 1000.0
    local bodyHealth = bodyHealth ~= nil and bodyHealth or 1000.0
    if VehicleStatus[plate] == nil then 
        if IsVehicleOwned(plate) then
            local statusInfo = GetVehicleStatus(plate)
            if statusInfo == nil then 
                statusInfo =  {
                    ["engine"] = engineHealth,
                    ["body"] = bodyHealth,
                    ["radiator"] = Config.MaxStatusValues["radiator"],
                    ["axle"] = Config.MaxStatusValues["axle"],
                    ["brakes"] = Config.MaxStatusValues["brakes"],
                    ["clutch"] = Config.MaxStatusValues["clutch"],
                    ["fuel"] = Config.MaxStatusValues["fuel"],
                }
            end
            VehicleStatus[plate] = statusInfo
            TriggerClientEvent("vehiclemod:client:setVehicleStatus", -1, plate, statusInfo)
        else
            local statusInfo = {
                ["engine"] = engineHealth,
                ["body"] = bodyHealth,
                ["radiator"] = Config.MaxStatusValues["radiator"],
                ["axle"] = Config.MaxStatusValues["axle"],
                ["brakes"] = Config.MaxStatusValues["brakes"],
                ["clutch"] = Config.MaxStatusValues["clutch"],
                ["fuel"] = Config.MaxStatusValues["fuel"],
            }
            VehicleStatus[plate] = statusInfo
            TriggerClientEvent("vehiclemod:client:setVehicleStatus", -1, plate, statusInfo)
        end
    else
        TriggerClientEvent("vehiclemod:client:setVehicleStatus", -1, plate, VehicleStatus[plate])
    end
end)

Framework.Functions.CreateCallback('qb-vehicletuning:server:UpdateDrivingDistance', function(source, cb, amount, plate)
	VehicleDrivingDistance[plate] = amount

    TriggerClientEvent('qb-vehicletuning:client:UpdateDrivingDistance', -1, VehicleDrivingDistance[plate], plate)

    Framework.Functions.ExecuteSql(false, "SELECT * FROM `characters_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] ~= nil then
            Framework.Functions.ExecuteSql(false, "UPDATE `characters_vehicles` SET `drivingdistance` = '"..amount.."' WHERE `plate` = '"..plate.."'")
        end
    end)
end)

Framework.Functions.CreateCallback('qb-vehicletuning:server:IsVehicleOwned', function(source, cb, plate)
    local retval = false
    Framework.Functions.ExecuteSql(false, "SELECT * FROM `characters_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] ~= nil then
            retval = true
        end
        cb(retval)
    end)
end)

Framework.Commands.Add("resetkm", "Reset km stand", {{name="License Plate", help="Vehicle License Plate."}}, false, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)

    if IsAuthorized(Player.PlayerData.citizenid) then
        local TargetId = args[1]
        if TargetId ~= nil then
			kenteken = args[1]
			
			TriggerClientEvent('qb-vehicletuning:client:ResetDrivingDistance', -1, DrivingDistance[Plate], Plate)

			Framework.Functions.ExecuteSql(false, "SELECT * FROM `characters_vehicles` WHERE `plate` = '"..Framework.CleanseString(Plate).."'", function(result)
				if result[1] ~= nil then
					Framework.Functions.ExecuteSql(false, "UPDATE `characters_vehicles` SET `drivingdistance` = '0' WHERE `plate` = '"..Framework.CleanseString(Plate).."'")
				else
				TriggerClientEvent('Framework:Notify', source, "License Plate van het voertuig is niet correct!")
				end
			end)
        else
            TriggerClientEvent('Framework:Notify', source, "No License Plate entered.")
        end
    else
        TriggerClientEvent('Framework:Notify', source, "You cannot do this!", "error") 
    end
end)

Framework.Functions.CreateCallback('qb-vehicletuning:server:LoadStatus', function(source, cb, veh, plate)
	VehicleStatus[plate] = veh
    TriggerClientEvent("vehiclemod:client:setVehicleStatus", -1, plate, veh)
end)

Framework.Functions.CreateCallback('vehiclemod:server:updatePart', function(source, cb, plate, part, level)
	if VehicleStatus[plate] ~= nil then
        if part == "engine" or part == "body" then
            VehicleStatus[plate][part] = level
            if VehicleStatus[plate][part] < 0 then
                VehicleStatus[plate][part] = 0
            elseif VehicleStatus[plate][part] > 1000 then
                VehicleStatus[plate][part] = 1000.0
            end
        else
            VehicleStatus[plate][part] = level
            if VehicleStatus[plate][part] < 0 then
                VehicleStatus[plate][part] = 0
            elseif VehicleStatus[plate][part] > 100 then
                VehicleStatus[plate][part] = 100
            end
        end
        TriggerClientEvent("vehiclemod:client:setVehicleStatus", -1, plate, VehicleStatus[plate])
    end
end)

Framework.Functions.CreateCallback('qb-vehicletuning:server:SetPartLevel', function(source, cb, plate, part, level)
	if VehicleStatus[plate] ~= nil then
        VehicleStatus[plate][part] = level
        TriggerClientEvent("vehiclemod:client:setVehicleStatus", -1, plate, VehicleStatus[plate])
    end
end)

Framework.Functions.CreateCallback('vehiclemod:server:fixEverything', function(source, cb, plate)
	if VehicleStatus[plate] ~= nil then 
        for k, v in pairs(Config.MaxStatusValues) do
            VehicleStatus[plate][k] = v
        end
        TriggerClientEvent("vehiclemod:client:setVehicleStatus", -1, plate, VehicleStatus[plate])
    end
end)

Framework.Functions.CreateCallback('vehiclemod:server:saveStatus', function(source, cb, plate)
	if VehicleStatus[plate] ~= nil then
        exports['ghmattimysql']:execute('UPDATE characters_vehicles SET status = @status WHERE plate = @plate', {['@status'] = json.encode(VehicleStatus[plate]), ['@plate'] = plate})
    end
end)

function IsVehicleOwned(plate)
    local retval = false
    Framework.Functions.ExecuteSql(true, "SELECT * FROM `characters_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] ~= nil then
            retval = true
        end
    end)
    return retval
end

function GetVehicleStatus(plate)
    local retval = nil
    Framework.Functions.ExecuteSql(true, "SELECT `status` FROM `characters_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] ~= nil then
            retval = result[1].status ~= nil and json.decode(result[1].status) or nil
        end
    end)
    return retval
end

Framework.Commands.Add("setvehiclestatus", "Set vehicle status", {{name="part", help="Type status dat je wilt bewerken"}, {name="amount", help="Level van de status"}}, true, function(source, args)
    local part = args[1]:lower()
    local level = tonumber(args[2])
    TriggerClientEvent("vehiclemod:client:setPartLevel", source, part, level)
end, "god")

Framework.Functions.CreateCallback('qb-vehicletuning:server:GetAttachedVehicle', function(source, cb)
    cb(Config.Plates)
end)

Framework.Functions.CreateCallback('qb-vehicletuning:server:IsMechanicAvailable', function(source, cb)
	local amount = 0
	for k, v in pairs(Framework.Functions.GetPlayers()) do
        local Player = Framework.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "mechanic" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
    end
    cb(amount)
end)

Framework.Functions.CreateCallback('qb-vehicletuning:server:SetAttachedVehicle', function(source, cb, veh, k)
	if veh ~= false then
        Config.Plates[k].AttachedVehicle = veh
        TriggerClientEvent('qb-vehicletuning:client:SetAttachedVehicle', -1, veh, k)
    else
        Config.Plates[k].AttachedVehicle = nil
        TriggerClientEvent('qb-vehicletuning:client:SetAttachedVehicle', -1, false, k)
    end
end)

Framework.Functions.CreateCallback('qb-vehicletuning:server:CheckForItems', function(source, cb, part)
	local src = source
    local Player = Framework.Functions.GetPlayer(src)
    local RepairPart = Player.Functions.GetItemByName(Config.RepairCostAmount[part].item)

    if RepairPart ~= nil then
        if RepairPart.amount >= Config.RepairCostAmount[part].costs then
            TriggerClientEvent('qb-vehicletuning:client:RepaireeePart', src, part)
            Player.Functions.RemoveItem(Config.RepairCostAmount[part].item, Config.RepairCostAmount[part].costs)

            for i = 1, Config.RepairCostAmount[part].costs, 1 do
                TriggerClientEvent('inventory:client:ItemBox', src, Framework.Shared.Items[Config.RepairCostAmount[part].item], "remove")
                Citizen.Wait(500)
            end
        else
            TriggerClientEvent('Framework:Notify', src, "You don't have enough "..Framework.Shared.Items[Config.RepairCostAmount[part].item]["label"].." (min. "..Config.RepairCostAmount[part].costs.."x)", "error")
        end
    else
        TriggerClientEvent('Framework:Notify', src, "You do not have "..Framework.Shared.Items[Config.RepairCostAmount[part].item]["label"].." with you!", "error")
    end
end)

function IsAuthorized(CitizenId)
    local retval = false
    for _, cid in pairs(Config.AuthorizedIds) do
        if cid == CitizenId then
            retval = true
            break
        end
    end
    return retval
end

Framework.Commands.Add("setmechanic", "Give someone a Mechanic job", {{name="id", help="ID Player"}}, false, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)

    if IsAuthorized(Player.PlayerData.citizenid) then
        local TargetId = tonumber(args[1])
        if TargetId ~= nil then
            local TargetData = Framework.Functions.GetPlayer(TargetId)
            if TargetData ~= nil then
                TargetData.Functions.SetJob("mechanic")
                TriggerClientEvent('Framework:Notify', TargetData.PlayerData.source, "You hired as an Autocare employee!")
                TriggerClientEvent('Framework:Notify', source, "You have ("..TargetData.PlayerData.charinfo.firstname..") hired as an Autocare employee!")
            end
        else
            TriggerClientEvent('Framework:Notify', source, "You must provide a Player ID!")
        end
    else
        TriggerClientEvent('Framework:Notify', source, "You cannot do this!", "error") 
    end
end)

Framework.Commands.Add("takemechanic", "Neem iemand zijn Mechanic baan af", {{name="id", help="ID van de Player"}}, false, function(source, args)
    local Player = Framework.Functions.GetPlayer(source)

    if IsAuthorized(Player.PlayerData.citizenid) then
        local TargetId = tonumber(args[1])
        if TargetId ~= nil then
            local TargetData = Framework.Functions.GetPlayer(TargetId)
            if TargetData ~= nil then
                if TargetData.PlayerData.job.name == "mechanic" then
                    TargetData.Functions.SetJob("unemployed")
                    TriggerClientEvent('Framework:Notify', TargetData.PlayerData.source, "You are fired! als Autocare medewerker!")
                    TriggerClientEvent('Framework:Notify', source, "You have ("..TargetData.PlayerData.charinfo.firstname..") fired as an Autocare employee!")
                else
                    TriggerClientEvent('Framework:Notify', source, "This is not an Autocare employee!", "error")
                end
            end
        else
            TriggerClientEvent('Framework:Notify', source, "You must provide a Player ID!", "error")
        end
    else
        TriggerClientEvent('Framework:Notify', source, "You cannot do this!", "error")
    end
end)

Framework.Functions.CreateCallback('qb-vehicletuning:server:GetStatus', function(source, cb, plate)
    if VehicleStatus[plate] ~= nil and next(VehicleStatus[plate]) ~= nil then
        cb(VehicleStatus[plate])
    else
        cb(nil)
    end
end)