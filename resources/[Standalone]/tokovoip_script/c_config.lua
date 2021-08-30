TokoVoipConfig = {
	refreshRate = 100,
	networkRefreshRate = 2000,
	playerListRefreshRate = 5000,
	minVersion = "1.5.0",
	enableDebug = false,
	distance = {
		10,
		3,
		30,
	},
	headingType = 0,
	radioKey = Keys["CAPS"],
	keySwitchChannels = Keys["~"],
	keySwitchChannelsSecondary = Keys["LEFTSHIFT"],
	keyProximity = Keys["~"],
	radioClickMaxChannel = 500,
	radioAnim = true,
	radioEnabled = true,
	wsServer = "5.135.141.44:33250",
	plugin_data = {
		TSChannel = "[cspacer]Server Chat",
		TSPassword = "j6JBK![<ftjtnCY4",
		TSChannelWait = "[cspacer]Waiting room",
		TSServer = "5.135.141.44:9987",
		TSChannelSupport = "Support Waiting room",
		TSDownload = "",
		TSChannelWhitelist = {
			"Support Waiting room",
			"Support 2",
		},
		local_click_on = true,
		local_click_off = true,
		remote_click_on = false,
		remote_click_off = true,
		enableStereoAudio = true,
	    ClickVolume = -15,
		localName = "Player",
		localNamePrefix = "[" .. GetPlayerServerId(PlayerId()) .. "] ",
	}
};

AddEventHandler("onClientResourceStart", function(resource)
	if (resource == GetCurrentResourceName()) then
		Citizen.CreateThread(function()
			if(TokoVoipConfig.plugin_data.localName == '') then
				TokoVoipConfig.plugin_data.localName = "Player"
			end
		end);
		TriggerEvent("initializeVoip");
	end
end)

function SetTokoProperty(key, value)
	if TokoVoipConfig[key] ~= nil and TokoVoipConfig[key] ~= "plugin_data" then
		TokoVoipConfig[key] = value
		if voip then
			if voip.config then
				if voip.config[key] ~= nil then
					voip.config[key] = value
				end
			end
		end
	end
end

exports("SetTokoProperty", SetTokoProperty)