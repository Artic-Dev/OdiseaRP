fx_version "bodacius"
games {"gta5"}

author "Blazester"
description "Script de registro de Odisea Live"
version "0.0.1"

client_script "src/*.lua"
server_script {
    "server/*.lua",
    "@mysql-async/lib/MySQL.lua"
}

