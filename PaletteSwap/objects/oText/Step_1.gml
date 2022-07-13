/// @description Insert description here
// You can write your code in this editor
if(!global.paused && started && !isDialog){
key_space = keyboard_check_released(vk_space) || keyboard_check_released(ord("P")) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("X"));
if (key_space) global.controller = 0;
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_space = 1;
	global.controller = 1;
}
}