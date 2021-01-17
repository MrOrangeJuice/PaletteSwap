/// @description Insert description here
// You can write your code in this editor
StretchBox(sTextbox, x1, y1, x2, y2, 0);
DrawSetText(c_black, fUI, fa_center, fa_top);
var print = string_copy(message, 1, textProgress);
draw_text((x1+x2)/2, y1+8, print);
if(global.paused){
	draw_set_color(c_gray);
}
else{
	draw_set_color(c_white);
}
draw_text((x1+x2)/2, y1+7, print);