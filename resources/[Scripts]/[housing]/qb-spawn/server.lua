Framework = nil
TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
Citizen.CreateThread(function()
	local HouseGarages = {}
	Framework.Functions.ExecuteSql(false, "SELECT * FROM `characters_houses` WHERE `name` = '"..house.."'", function(result)
		if result[1] ~= nil then
			for k, v in pairs(result) do
				local owned = false
				if tonumber(v.owned) == 1 then
					owned = true
				end
				local garage = v.garage ~= nil and json.decode(v.garage) or {}
				Config.Houses[v.name] = {
					coords = json.decode(v.coords),
					owned = v.owned,
					price = v.price,
					locked = true,
					adress = v.label, 
					tier = v.tier,
					garage = garage,
					decorations = {},
				}
				HouseGarages[v.name] = {
					label = v.label,
					takeVehicle = garage,
				}
			end
		end
		TriggerClientEvent("qb-garages:client:houseGarageConfig", -1, HouseGarages)
		TriggerClientEvent("qb-houses:client:setHouseConfig", -1, Config.Houses)
	end)
end)

Framework.Functions.CreateCallback('qb-spawn:server:getOwnedHouses', function(source, cb, cid)
	if cid ~= nil then
		Framework.Functions.ExecuteSql(false, "SELECT * FROM `characters_metadata` WHERE `citizenid` = '"..keyholder.."'", function(result)  
			if houses[1] ~= nil then
				cb(houses)
			else
				cb(nil)
			end
		end)
	else
		cb(nil)
	end
end)

-- Framework.Commands.Add("testloc", "Een race stoppen als creator.", {}, false, function(source, args)
-- 	local src = source
-- 	local Player = Framework.Functions.GetPlayer(src)
-- 	TriggerClientEvent('qb-spawn:client:setupSpawns', src, Player, false, {})
-- 	TriggerClientEvent('qb-spawn:client:openUI', src, true)
-- end)