
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

loadscreen 'index.html'

-- Tell server we will close the loading screen resource ourselfs
loadscreen_manual_shutdown "yes"
-- Client Script
client_script "client.lua"


files {
    'index.html',
    'stylesheet.css',
    'config.js',
    'app.js',
    'config.css',
    'imgs/*.jpg',
    'imgs/*.png',
	'CodePredators-Regular.ttf',
}
