/// @description Insert description here
// You can write your code in this editor
if(!global.paused && triggered && !global.canControlTimer && started){
key_space = keyboard_check_released(vk_space) || keyboard_check_released(ord("P")) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("X"));

//update dependent text object
if (instance_exists(text)) text.key_space = key_space;

if (key_space) global.controller = 0;
if (gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1))
{
	key_space = 1;
	if (instance_exists(text)) text.key_space = 1;
	global.controller = 1;
}
}