/// @description Checking key presses
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_select = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P"));

if (key_down) || (key_up) || (key_select)
{
	global.controller = 0;
}

if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
	global.controller = 1;
}

if ((gamepad_axis_value(4,gp_axislv) > 0.4  && lastAxis4Value <= 0.4) || gamepad_button_check_pressed(4,gp_padd) || (gamepad_axis_value(0,gp_axislv) > 0.4  && lastAxis0Value <= 0.4) || gamepad_button_check_pressed(0,gp_padd))
{
	key_down = 1;
	global.controller = 1;
}
if ((gamepad_axis_value(4,gp_axislv) < -0.4 && lastAxis4Value >= -0.4) || gamepad_button_check_pressed(4,gp_padu) || (gamepad_axis_value(0,gp_axislv) < -0.4 && lastAxis0Value >= -0.4) || gamepad_button_check_pressed(0,gp_padu))
{
	key_up = 1;
	global.controller = 1;
}

// Mouse menu
var mouse_y_gui = device_mouse_y_to_gui(0);
if(menuActive && global.mouse)
{
	if (mouse_y_gui > menuY) && (mouse_y_gui < menuBottom)
	{
		prevMenuIndex = menuIndex;
		if (mouse_y_gui > menuY) && (mouse_y_gui < (menuY + (menuBottom / 6)) - menuOffset) menuIndex = 0;
		if (mouse_y_gui > (menuY + (menuBottom / 6)) - menuOffset) && (mouse_y_gui < (menuY + (2 * menuBottom / 6)) - menuOffset) menuIndex = 1;
		if (mouse_y_gui >(menuY + (2 * menuBottom / 6)) - menuOffset) && (mouse_y_gui <  (menuY + (3 * (menuBottom / 6)) - menuOffset)) menuIndex = 2;
	
		if (prevMenuIndex != menuIndex)
		{
			audio_play_sound(snd_Menu, 5, false);	
		}
	
		if (mouse_check_button_pressed(mb_left))
		{
			key_select = 1;
		}
	}
}
else if (!menuActive && global.mouse)
{
	if (mouse_y_gui > optionsY) && (mouse_y_gui < optionBottom)
	{
		prevOptionIndex = optionsIndex;
		if (mouse_y_gui > optionsY) && (mouse_y_gui < (optionsY + (optionBottom / 8)) - optionOffset) optionsIndex = 0;
		if (mouse_y_gui > (optionsY + (optionBottom / 8)) - optionOffset) && (mouse_y_gui < (optionsY + (2 * optionBottom / 8)) - optionOffset) optionsIndex = 1;
		if (mouse_y_gui > (optionsY + (2 * optionBottom / 8)) - optionOffset) && (mouse_y_gui < (optionsY + (3 * (optionBottom / 8)) - optionOffset)) optionsIndex = 2;
		if (mouse_y_gui > (optionsY + (3 * optionBottom / 8)) - optionOffset) && (mouse_y_gui < (optionsY + (4 * (optionBottom / 8)) - optionOffset)) optionsIndex = 3;
	
		if (prevOptionIndex != optionsIndex)
		{
			audio_play_sound(snd_Menu, 5, false);	
		}
	
		if (mouse_check_button_pressed(mb_left))
		{
			key_select = 1;
		}
	}
}

if(key_select == 1){
	if(menuActive)
	{
		// Do main menu action
		switch(menuIndex){
			case 0:
				//global.color_limit = 1;
				// Load in data
				Load();
				if(global.tutorialCompleted)
				{
					SlideTransition(TRANS_MODE.GOTO, rHub);
				}
				else
				{
					SlideTransition(TRANS_MODE.GOTO, rTutorial);
				}
				break;
			/*
			case 1:
				SlideTransition(TRANS_MODE.GOTO, rLevelSelect);
				break;
			*/
			case 1:
				global.mouse = 0;
				menuActive = false;
				break;
			case 2:
				game_end();
				break;
			default:
				break;
			}
	}
	else
	{
		// Do options menu action
		switch(optionsIndex)
		{
			case 0:
				global.mouse = 0;
				window_set_fullscreen(!window_get_fullscreen());
				if(!global.fullscreen) global.fullscreen = true;
				else if(global.fullscreen) global.fullscreen = false;
					break;
			case 1:
				if(!global.colorblind) global.colorblind = true;
				else if(global.colorblind) global.colorblind = false;
				break;
			case 2:
				if(file_exists("savedata.ini")){
					file_delete("savedata.ini");
				}
				break;
			case 3:
				global.mouse = 0;
				menuActive = true;
				break;
			default:
				break;
		}
	}
	audio_play_sound(snd_MenuSelect,5,false);
}

// Play sound
if(key_down || key_up)
{
	audio_play_sound(snd_Menu,5,false);	
}

if(menuActive)
{
	menuIndex += key_down - key_up;
	if(menuIndex < 0){
		menuIndex = buttonCount - 1;	
	}
	else if(menuIndex > buttonCount - 1){
		menuIndex = 0;	
	}
}
else
{
	optionsIndex += key_down - key_up;
	if(optionsIndex < 0){
		optionsIndex = optionCount - 1;	
	}
	else if(optionsIndex > optionCount - 1){
		optionsIndex = 0;	
	}
}
lastSelected = menuIndex;
lastAxis0Value = gamepad_axis_value(0, gp_axislv);
lastAxis4Value = gamepad_axis_value(4, gp_axislv);


// Move camera
if(!menuActive && (camOffset != camDistance))
{
	camOffset += 10;
	camera_set_view_pos(cam,(x-144) + camOffset,y-96);	
}

if(menuActive && (camOffset != 0))
{
	camOffset -= 10;
	camera_set_view_pos(cam,(x-144) + camOffset,y-96);
}

// Update fullscreen toggle
if(global.fullscreen)
{
	options[0] = "Fullscreen: On";	
}
else
{
	options[0] = "Fullscreen: Off";	
}

// Update colorblind toggle
if(global.colorblind)
{
	options[1] = "Color Blind: On";	
}
else
{
	options[1] = "Color Blind: Off";	
}