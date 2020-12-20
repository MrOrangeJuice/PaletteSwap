/// @description Check For Full Screen
if (keyboard_check(vk_control)) && (keyboard_check_pressed(ord("F"))) 
{
	window_set_fullscreen(!window_get_fullscreen());
}