/// @description Insert description here
// You can write your code in this editor

x1 = RES_W / 2;
y1 = RES_H - 70;
x2 = RES_W / 2;
y2 = RES_H;

x1Target = 0;
x2Target = RES_W;

lerpProgress = 0;
textProgress = 0;

curResponse = 0;
global.textUp = true;
curResponseId = 0;
textList = ds_list_create();
startOfText = 1;
started = false;

key_space = 0;