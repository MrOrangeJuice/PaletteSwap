/// @description Insert description here
// You can write your code in this editor

key_space = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P"));
if(key_space)
{
	global.controller = 0;	
}
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_space = 1;
	global.controller = 1;
}

vsp += 0.05 * vdir;
if(vsp > 0.5 || vsp < -0.5) vdir *= -1;
y = y + vsp;

if(createdText && key_space)
{
	instance_destroy();	
}