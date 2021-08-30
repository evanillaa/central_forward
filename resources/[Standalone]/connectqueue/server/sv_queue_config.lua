Config = {}

Framework = nil

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

Config.Priority = {}

Config.RequireSteam = true

Config.PriorityOnly = false

Config.DisableHardCap = true

Config.ConnectTimeOut = 600

Config.QueueTimeOut = 90

Config.EnableGrace = true

Config.GracePower = 2

Config.GraceTime = 120

Config.JoinDelay = 30000

Config.ShowTemp = false

Config.Language = {
    joining = "\xF0\x9F\x8E\x89Loading..",
    connecting = "\xE2\x8F\xB3connecting...",
    idrr = "\xE2\x9D\x97[Queue] Error: Unable to get IDs, try rebooting.",
    err = "\xE2\x9D\x97[Queue] There was an error",
    pos = "\xF0\x9F\x90\x8CYou stand %d/%d in the queue \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[Queue] Error: Unable to add to the queue..",
    timedout = "\xE2\x9D\x97[Queue] Error: Timed out",
    wlonly = "\xE2\x9D\x97[Queue] You must have a whitelist to join the server..",
    steam = "\xE2\x9D\x97 [Queue] Error: Steam must be on.."
}

Citizen.CreateThread(function()
	LoadQueueDatabase()
end)

function LoadQueueDatabase()
	Framework.Functions.ExecuteSql(false, "SELECT * FROM `server_extra`", function(result)
		if result[1] ~= nil then
			for k, v in pairs(result) do
				Config.Priority[v.steam] = tonumber(v.priority)
			end
		end
	end)
end

Framework.Commands.Add("reloadprio", "Reload the queue", {}, false, function(source, args)
	LoadQueueDatabase()
	TriggerClientEvent('Framework:Notify', Player.PlayerData.source, "Je queue is refreshed..", "success")	
end, "god")

Framework.Commands.Add("addpriority", "Prioritize queue", {{name="id", help="ID van de Player"}, {name="priority", help="Priority level"}}, true, function(source, args)
    local Player = Framework.Functions.GetPlayer(tonumber(args[1]))
	local level = tonumber(args[2])
	if Player ~= nil then
		AddPriority(Player.PlayerData.source, level)
		TriggerClientEvent('Framework:Notify', Player.PlayerData.source, "Je queue prioriteit is aangepast.", "success")
        TriggerClientEvent('chatMessage', source, "SYSTEM", "normal", "Je hebt " .. GetPlayerName(Player.PlayerData.source) .. " prioriteit gegeven ("..level..")")	
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is niet online!")	
	end
end, "god")

Framework.Commands.Add("removepriority", "Take priority away from someone", {{name="id", help="ID van de Player"}}, true, function(source, args)
	local Player = Framework.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		RemovePriority(Player.PlayerData.source)
		TriggerClientEvent('Framework:Notify', Player.PlayerData.source, "Your queue priority has been removed.", "error")
        TriggerClientEvent('chatMessage', source, "SYSTEM", "normal", "You took priority away from " .. GetPlayerName(Player.PlayerData.source))	
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")	
	end
end, "god")

function AddPriority(source, level)
	local Player = Framework.Functions.GetPlayer(source)
	if Player ~= nil then 
		Config.Priority[GetPlayerIdentifiers(source)[1]] = level
		Framework.Functions.ExecuteSql(true, "INSERT INTO `server_extra` (`name`, `steam`, `license`, `priority`, `permission`) VALUES ('"..GetPlayerName(source).."', '"..GetPlayerIdentifiers(source)[1].."', '"..GetPlayerIdentifiers(source)[2].."', '"..level.."'), '"..Framework.Functions.GetPermission(source).."'")
		Player.Functions.UpdatePlayerData()
	end
end

function RemovePriority(source)
	local Player = Framework.Functions.GetPlayer(source)
	if Player ~= nil then 
		Config.Priority[GetPlayerIdentifiers(source)[1]] = nil
		Framework.Functions.ExecuteSql(true, "DELETE FROM `server_extra` WHERE `steam` = '"..GetPlayerIdentifiers(source)[1].."'")
	end
end