/// @description Insert description here
// You can write your code in this editor

key_space = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P"));
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_space = 1;
	global.controller = 1;
}
