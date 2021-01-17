#macro RES_W 320
#macro RES_H 180
display_set_gui_size(RES_W,RES_H);

// Create basic global variables.
global.coins = 0;
global.time = 0;
global.paused = false;

global.hp = 100;
global.maxHP = 100;

global.color = 0;
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