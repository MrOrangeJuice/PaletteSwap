#macro SAVEFILE "Save.ini"
display_set_gui_size(RES_W,RES_H);

// Create basic global variables.
global.coins = 0;
global.time = 0;
global.paused = false;
global.cutscene = false;
global.controller = 0;
global.mouse = 0;
global.textUp = false;

global.hp = 100;
global.maxHP = 100;
global.textSpeed = .75;
//global.textUp = false;
global.lastAxislv4Value = 0;
global.lastAxislv0Value = 0;
//global.coinId = 0;
//global.coinArrX = ds_list_create();
//global.coinArrY = ds_list_create();
global.lastCheckpointX = 0;
global.lastCheckpointY = 0;
//global.coinsDestroyed = false;
global.loadCoinsX = ds_list_create();
global.loadCoinsY = ds_list_create();
global.loadX = 0;
global.loadY = 0;
global.loadHp = 100;
//global.loadCoins = 0;
global.loadTime = 0;
global.loaded = false;
//global.coinId = 0;
global.canControlTimer = -1;

//flag for player being in a speedrun level
global.isSpeedrun = false;

//flag for activating dialog objects in the hub
global.spawnHubDialog = false;
//control for dialog cam
global.useDialogCam = false;

// Player data
global.tutorialCompleted = false;
global.templeCompleted = false;
global.seasideCompleted = false;
global.factoryCompleted = false;

// Options
global.fullscreen = false;
global.colorblind = false;

global.templeGears = 4;
global.seasideGears = 4;
global.vendingGears = 7;
global.factoryGears = 5;
global.speedrun1Gears = 2;
global.speedrun2Gears = 2;
global.speedrun3Gears = 2;
global.vendingGearsCollected = 0;
global.gearTotal = 0;
global.allPalettesUnlocked = false;

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

global.factoryGearArray = array_create(global.factoryGears);
for(i = 0; i < global.factoryGears; i++)
{
	global.factoryGearArray[i] = false;	
}

global.speedrun1GearArray = array_create(global.speedrun1Gears);
for(i = 0; i < global.speedrun1Gears; i++)
{
	global.speedrun1GearArray[i] = false;	
}

global.speedrun2GearArray = array_create(global.speedrun2Gears);
for(i = 0; i < global.speedrun2Gears; i++)
{
	global.speedrun2GearArray[i] = false;	
}

global.speedrun3GearArray = array_create(global.speedrun3Gears);
for(i = 0; i < global.speedrun3Gears; i++)
{
	global.speedrun3GearArray[i] = false;	
}

//array to store best times in speedrun levels
srRooms = 3;
global.speedrunBests = array_create(srRooms);
for(i = 0; i < srRooms; i++){
	global.speedrunBests[i] = -1;
}

// Set cursor
prevMousePos = device_mouse_x_to_gui(0);

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
gearHUDX = 160;
gearHUDY = 12;

global.color_limit = 4; //limit scrollover

global.color_count = 4;

//game scale settings
global.gameWidth = 960;
global.gameHeight = 540;
global.currentDoorId = 0;
global.useCurrentDoorSpawn = false;
global.isEnteringDoor = false;
global.skipPortalAnimation = false;