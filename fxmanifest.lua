fx_version 'cerulean'

name 'SR - Rampok Warung'

author 'sleepyrae/sleepyexe'

description 'Script Buatan Sleepy Rae / github.com/sleepyexe'

game 'gta5'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}