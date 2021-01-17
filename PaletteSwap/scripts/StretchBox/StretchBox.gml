// Script to stretch sprite to form text box based on given size
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StretchBox(argument0, argument1, argument2, argument3, argument4, argument5) {
var size = sprite_get_width(argument0) / 3;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;
var index = argument5;
var width = x2 - x1;
var height = y2 - y1;
var boxColor;
if(global.paused){
	boxColor = c_gray;
}
else{
	boxColor = c_white;	
}

draw_sprite_part_ext(argument0, index, size, size, 1, 1, x1+size, y1+size, width-(size*2), height-(size*2), boxColor, 1);

draw_sprite_part_ext(argument0, index, 0, 0, size, size, x1, y1, 1, 1, boxColor, 1);

draw_sprite_part_ext(argument0, index, size*2, 0, size, size, width+x1-size, y1, 1, 1, boxColor, 1);

draw_sprite_part_ext(argument0, index, 0, size*2, size, size, x1, height+y1-size, 1, 1, boxColor, 1);

draw_sprite_part_ext(argument0, index, size*2, size*2, size, size, width+x1-size, height+y1-size, 1, 1, boxColor, 1);

draw_sprite_part_ext(argument0, index, 0, size, size, 1, x1, y1+size, 1, height-(size*2), boxColor, 1);

draw_sprite_part_ext(argument0, index, size*2, size, size, 1, width+x1-size, y1+size, 1, height-(size*2), boxColor, 1);

draw_sprite_part_ext(argument0, index, size, 0, 1, size, x1+size, y1, width-(size*2), 1, boxColor, 1);

draw_sprite_part_ext(argument0, index, size, size*2, 1, size, x1+size, height+y1-size, width-(size*2), 1, boxColor, 1);
}