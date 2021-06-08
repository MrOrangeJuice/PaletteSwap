/// @description Insert description here
// You can write your code in this editor
//draw_sprite_stretched(sTextBubble, global.color, x1, y1, RES_W, RES_H);

StretchBox(sTest1, x1+3, y1+3, x2-3, y2-3, 0);
StretchBox(sTest3, x1+6, y1+6, x2-6, y2-6, 0);
StretchBox(sTest2, x1+9, y1+9, x2-9, y2-9, 0);
DrawSetText(c_black, fUI, fa_center, fa_top);
var print = string_copy(curResponse, 1, textProgress);
draw_text((x1+x2)/2, y1+12, print);
if(global.paused){
	draw_set_color(c_gray);
}
else{
	draw_set_color(c_white);
}
draw_text((x1+x2)/2, y1+11, print);