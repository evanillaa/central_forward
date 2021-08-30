resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

ui_page "html/index.html"

client_scripts {
 'config.lua',
 'client/client.lua',
 'client/compass.lua',
}

server_scripts {
 'config.lua',
 'server/server.lua'
}

exports {
 'SetSeatbelt',
}

files {
 "html/index.html",
 "html/js/script.js",
 "html/css/style.css",
 'html/css/*.ttf',
 "html/img/belt.png"
}