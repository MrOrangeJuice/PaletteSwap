/// @description Look for player input
key_swap_down = keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("U"));
key_swap_up = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(ord("I"));

if (key_swap_up) || (key_swap_down)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(4,gp_shoulderl) || gamepad_button_check_pressed(4,gp_shoulderl))
{
	key_swap_down = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(4,gp_shoulderr) || gamepad_button_check_pressed(4,gp_shoulderr))
{
	key_swap_up = 1;
	global.controller = 1;
}

if(key_swap_up || key_swap_down)
{
	global.cutscene = false;
	global.color++;
	if (global.color >= global.color_limit) global.color = 0;
	// Create swapping effects
	instance_create_layer(oPlayer.x,oPlayer.y,"FX",oRift);
	audio_play_sound(snd_Swap,5,false);
	ScreenShake(2,10);
	global.paused = false;
	instance_destroy();	
}