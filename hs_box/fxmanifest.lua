fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_script '@es_extended/imports.lua'
ui_page 'html/index.html'

client_scripts {
   'config.lua',
   'client/client.lua',
}

server_scripts {
   'config.lua',
   'server/server.lua',

}


files {
   'html/index.html',
   'html/style.css',
   'html/reset.css',
   'html/listener.js',
   'html/bg.png',
   'html/logo.png',

}