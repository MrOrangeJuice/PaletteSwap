#macro RES_W 320
#macro RES_H 180
display_set_gui_size(RES_W,RES_H);

// Create basic global variables.
global.coins = 0;
global.time = 0;
global.paused = false;

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

global.color = 0;
global.loaded = false;
global.loadX = 0;
global.loadY = 0;
global.loadCoins = 0;
global.loadHp = 100;
global.loadTime = 0;
global.loadCoinsX = ds_list_create();
global.loadCoinsY = ds_list_create();
global.coinsDestroyed = false;
//0 green
//1 blue
//2 red
//3 purple
hpTextScale = 1;
coinTextScale = 1;
timeTextScale = 1.2;
paletteTextScale = 1;
timeScaleSet = false;

global.color_limit = 2; //limit scrollover

global.color_count = 2;