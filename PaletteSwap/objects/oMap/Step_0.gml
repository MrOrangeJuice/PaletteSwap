/// @description Insert description here
// You can write your code in this editor
if(!global.paused){
key_tab = keyboard_check_pressed(vk_tab);
/*
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_space = 1;
	global.controller = 1;
}
*/
}
if (key_tab) mapUp = !mapUp;