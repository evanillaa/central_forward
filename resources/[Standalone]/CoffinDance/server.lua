RegisterServerEvent('CoffinDance:syncSpawnPeds')
AddEventHandler('CoffinDance:syncSpawnPeds', function(coords, type, coffNet, pedNet, pedNet2, pedNet3, pedNet4, pedNet5, pedNet6, mainPedNet)
	TriggerClientEvent("CoffinDance:SpawnPeds", -1, coords, type, coffNet, pedNet, pedNet2, pedNet3, pedNet4, pedNet5, pedNet6, mainPedNet)
end)

RegisterServerEvent('CoffinDance:syncEndCoffinDance')
AddEventHandler('CoffinDance:syncEndCoffinDance', function(coffNet, pedNet, pedNet2, pedNet3, pedNet4, pedNet5, pedNet6, mainPedNet)
	local _source = source
	TriggerClientEvent("CoffinDance:endCoffinDance", _source, coffNet, pedNet, pedNet2, pedNet3, pedNet4, pedNet5, pedNet6, mainPedNet)
end)