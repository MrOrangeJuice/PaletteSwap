#macro SAVEFILE "Save.ini"
display_set_gui_size(RES_W,RES_H);

// Create basic global variables.
global.coins = 0;
global.time = 0;
global.paused = false;
global.cutscene = false;
global.controller = 0;
global.mouse = 0;

global.hp = 100;
global.maxHP = 100;
global.textSpeed = .75;
global.textUp = false;
global.lastAxislv4Value = 0;
global.lastAxislv0Value = 0;
global.coinId = 0;
global.coinArrX = ds_list_create();
global.coinArrY = ds_list_create();
global.lastCheckpointX = 0;
global.lastCheckpointY = 0;
global.coinsDestroyed = false;
global.loadCoinsX = ds_list_create();
global.loadCoinsY = ds_list_create();
global.loadX = 0;
global.loadY = 0;
global.loadHp = 100;
global.loadCoins = 0;
global.loadTime = 0;
global.loaded = false;
global.coinId = 0;
global.canControlTimer = -1;

// Player data
global.tutorialCompleted = false;

// Options
global.fullscreen = false;
global.colorblind = false;

global.templeGears = 5;
global.seasideGears = 4;
global.gearTotal = 0;

global.templeGearArray = array_create(global.templeGears);
for(i = 0; i < global.templeGears; i++)
{
	global.templeGearArray[i] = false;
}

global.seasideGearArray = array_create(global.seasideGears);
for(i = 0; i < global.seasideGears; i++)
{
	global.seasideGearArray[i] = false;
}

// Set cursor
prevMousePos = mouse_x;

global.color = 0;
//0 green
//1 blue
//2 red
//3 purple
hpTextScale = 1;
coinTextScale = 1;
timeTextScale = 1.2;
paletteTextScale = 1;
collectableTextScale = 1;
timeScaleSet = false;

global.color_limit = 2; //limit scrollover

global.color_count = 2;