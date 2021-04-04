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

global.canControlTimer--;

if(global.coins != 100 && !global.paused && !global.textUp)
{
	global.time++;
}
else
{
	if(!timeScaleSet && !global.paused && room == rTest)
	{
		ini_open(SAVEFILE);
		show_debug_message(global.time);
		show_debug_message(ini_read_real("Vars", "best", 0));
		if(ini_read_real("Vars", "best", 0) == 0 || global.time < ini_read_real("Vars", "best", 0)){
			ini_write_real("Vars", "best", global.time);
		}
		ini_close();
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