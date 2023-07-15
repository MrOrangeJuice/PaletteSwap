// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SwapPalette(_player, _new_color){
	global.color = _new_color;
	if (global.color >= global.color_limit) global.color = 0;
	else if (global.color < 0) global.color = global.color_limit - 1;
	// Create swapping effects
	instance_create_layer(_player.x, _player.y, "FX", oRift);
	audio_play_sound(snd_Swap,5,false);
	ScreenShake(2,10);
	_player.canSwap = false;
	_player.alarm[2] = room_speed * 0.2;
	// Destroy all bubbles
	instance_destroy(oBubble);
}