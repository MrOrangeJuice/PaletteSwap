/// @description Insert description here
// You can write your code in this editor

if (triggered){
	//draw face and name here
	draw_sprite(face, global.color, 3, RES_H / 2);
	
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
else if(global.color == 3){
	draw_set_color($2C142D);
}
draw_text(55, RES_H/2 + 11, eName);
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
else if(global.color == 3){
	draw_set_color($B8208E);
}
draw_text(55, RES_H/2 + 10, eName);

}