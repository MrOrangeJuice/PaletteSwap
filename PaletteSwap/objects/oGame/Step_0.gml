/// @description Check For Full Screen
if (keyboard_check(vk_control)) && (keyboard_check_pressed(ord("F"))) 
{
	window_set_fullscreen(!window_get_fullscreen());
}

if(global.coins != 100 && !oScreenDarken.paused)
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

// Set tile layer
if(global.color == 1)
{
	layer_set_visible("GreenTiles", false);	
	layer_set_visible("GreenBackground", false);	
}
if(global.color == 0)
{
	layer_set_visible("GreenTiles", true);	
	layer_set_visible("GreenBackground", true);	
}