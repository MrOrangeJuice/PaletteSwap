/// @description Update core-game elements.
if (keyboard_check(vk_control)) && (keyboard_check_pressed(ord("F"))) 
{
	window_set_fullscreen(!window_get_fullscreen());
}

// Switch which UI object is active based-on what state the game is in.
if (global.paused == true)
{
	global.pauseMenu.visible = true;
	global.hud.visible = false;
}
else 
{
	global.pauseMenu.visible = false;
	global.hud.visible = true;
}

if(global.coins != 100 && !global.paused)
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