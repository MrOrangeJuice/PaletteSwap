#macro RES_W 320
#macro RES_H 180
display_set_gui_size(RES_W,RES_H);

global.coins = 0;
coinTextScale = 1;
global.time = 0;
timeTextScale = 1;
timeScaleSet = false;

global.color = 0;
//0 green
//1 blue
//2 red
//3 purple

global.color_limit = 2; //limit scrollover

global.color_count = 2;