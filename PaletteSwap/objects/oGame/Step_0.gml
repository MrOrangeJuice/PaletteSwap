/// @description Check For Full Screen
if (keyboard_check(vk_control)) && (keyboard_check_pressed(ord("F"))) 
{
	window_set_fullscreen(!window_get_fullscreen());
	if(!global.fullscreen) global.fullscreen = true;
	else if(global.fullscreen) global.fullscreen = false;
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



// Turn mouse off if player inputs something
if(keyboard_check(vk_anykey) || global.controller = 1)
{
	global.mouse = 0;
}


if(prevMousePos < device_mouse_x_to_gui(0) - 3 || prevMousePos > device_mouse_x_to_gui(0) + 3)
{
	global.mouse = 1;
	global.controller = 0;
}

prevMousePos = device_mouse_x_to_gui(0);

// Set tile layer and cursor
if(global.color == 1)
{
	if(global.mouse)
	{
		cursor_sprite = sCursorBlue;
	}
	else
	{
		cursor_sprite = sCursorNone;	
	}
	layer_set_visible("GreenTiles", false);	
	layer_set_visible("GreenBackground", false);
	layer_set_visible("GreenClouds", false);
	layer_set_visible("BlueTiles", true);	
	layer_set_visible("BlueBackground", true);
	layer_set_visible("BlueClouds", true);
}
if(global.color == 0)
{
	if(global.mouse)
	{
		cursor_sprite = sCursor;
	}
	else
	{
		cursor_sprite = sCursorNone;	
	}
	layer_set_visible("GreenTiles", true);	
	layer_set_visible("GreenBackground", true);
	layer_set_visible("GreenClouds", true);
	layer_set_visible("BlueTiles", false);	
	layer_set_visible("BlueBackground", false);
	layer_set_visible("BlueClouds", false);
}