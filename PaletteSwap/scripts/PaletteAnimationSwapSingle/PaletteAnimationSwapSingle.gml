// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PaletteAnimationSwapSingle(){
	framecount = sprite_get_number(sprite_index) / global.color_count;
	image_index = currentframe + (global.color * framecount);
	if (!global.paused && !global.textUp){
		currentframe += sprite_get_speed(sprite_index) / room_speed;
	}
	if (currentframe >= framecount){
		event_perform(ev_other, ev_animation_end);
	}
}