/// @description Insert description here
// You can write your code in this editor
if (displayed){
	key_space = keyboard_check(global.jumpKey) || keyboard_check(global.jumpAltKey);
	if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
	{
	key_space = 1;
	global.controller = 1;
	}
}
