/// @description Check For Full Screen
if (keyboard_check(vk_control)) && (keyboard_check_pressed(ord("F"))) 
{
	window_set_fullscreen(!window_get_fullscreen());
}



if(global.coins != 100)
{
	global.time++;
}
else
{
	if(!timeScaleSet)
	{
		timeTextScale = 1.2;
		timeScaleSet = true;
	}
}