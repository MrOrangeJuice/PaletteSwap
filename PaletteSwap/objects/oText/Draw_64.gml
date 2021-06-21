/// @description Insert description here
// You can write your code in this editor
//draw_sprite_stretched(sTextBubble, global.color, x1, y1, RES_W, RES_H);

/*
StretchBox(sTest1, x1+3, y1+3, x2-3, y2-3, global.color);
StretchBox(sTest3, x1+6, y1+6, x2-6, y2-6, global.color);
StretchBox(sTest2, x1+9, y1+9, x2-9, y2-9, global.color);
*/
draw_sprite(sTextFrame,global.color,x1,y1);
DrawSetText(c_black, fGame, fa_center, fa_top);
// Draw shadow
if(global.color == 0)
{
	draw_set_color($042700);
}
else if(global.color == 1){
	draw_set_color($331800);
}
else if(global.color == 2){
	draw_set_color($00002B);
}
var print = string_copy(curResponse, 1, textProgress);
draw_text_transformed((x1+x2)/2, y1+9.25, print, 1.25, 1.25, 0);
// Draw main text
if(global.color == 0)
{
	draw_set_color($37802A);
}
else if(global.color == 1){
	draw_set_color($8C5F00);
}
else if(global.color == 2){
	draw_set_color($00189F);
}
draw_text_transformed((x1+x2)/2, y1+8, print, 1.25, 1.25, 0);