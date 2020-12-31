// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//this method manually updates the frame for animated sprites, allowing for multiple colors to be in the
//same list of frames in a sprite. requires a currentframe variable
function PaletteAnimationSwap(){
	framecount = sprite_get_number(sprite_index) / global.color_count;
	image_index = currentframe + (global.color * framecount);
	currentframe += sprite_get_speed(sprite_index) / room_speed;
	if (currentframe >= framecount){
		currentframe = 0;
	}
}