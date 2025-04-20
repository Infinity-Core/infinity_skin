game 		 'rdr3'
fx_version 	 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 	     'ALTITUDE-DEV.COM'
description  'infinitycore system skin fully sync with core'
version 	 '1.0.2'
infinitycore_dev 	    'Shepard & iireddev'


ui_page "ui/index.html"
files {
	"ui/index.html",
	"ui/assets/*.png",
	"ui/assets/heritage/*.jpg",
	"ui/vendor/*.css",
	"ui/front.js",
	"ui/script.js",
	"ui/style.css"
}

client_scripts {
    'client/cl_main.lua',
   	'cloth_hash_names.lua',
	'overlays.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/sv_main.lua',
}

export 'GetOverlayData'
export 'GetTorso'
export 'GetLegs'
export 'GetComponentId'
export 'GetBodyComponents'