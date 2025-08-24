fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'mechanic_shop'
description 'NPC toko mekanik'
version '1.0.0'

shared_scripts {
  '@ox_lib/init.lua',
  '@es_extended/imports.lua',
  'config.lua'
}

client_scripts {
  'client.lua'
}

server_scripts {
  'server.lua'
}

dependencies {
  'es_extended',
  'ox_lib',
  'ox_inventory'
}
