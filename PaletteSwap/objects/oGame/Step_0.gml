/// @description Check For Full Screen
if (keyboard_check(vk_control)) && (keyboard_check_pressed(ord("F"))) 
{
	window_set_fullscreen(!window_get_fullscreen());
}

// Switch which UI object is active based-on what state the game is in.
if (global.paused)
{
	instance_activate_object(pauseMenu);
	instance_deactivate_object(playerHUD);
}
else 
{
	instance_activate_object(playerHUD);
	instance_deactivate_object(pauseMenu);
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