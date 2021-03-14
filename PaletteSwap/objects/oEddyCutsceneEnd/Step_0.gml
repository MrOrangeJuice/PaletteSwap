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
	instance_destroy();	
}