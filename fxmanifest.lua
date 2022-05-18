fx_version 'adamant'
game 'gta5'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
    "@es_extended/locale.lua",
    "client/event.lua",
    "client/cocktails.lua",
    "client/patron.lua",
    "client/vestiaire.lua",
    "client/coffre.lua",
    "client/garage.lua",
    "client/menu.lua",
    "config.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "@es_extended/locale.lua",
    "server/server.lua",
    "config.lua"
}