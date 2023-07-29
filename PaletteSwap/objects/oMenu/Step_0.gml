/// @description Checking key presses
key_down = global.downKeyPressed
key_up = global.upKeyPressed;
key_select = global.menuSelect;

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
		if (mouse_y_gui > optionsY) && (mouse_y_gui < (optionsY + (optionBottom / 10)) - optionOffset) optionsIndex = 0;
		if (mouse_y_gui > (optionsY + (optionBottom / 10)) - optionOffset) && (mouse_y_gui < (optionsY + (2 * optionBottom / 10)) - optionOffset) optionsIndex = 1;
		if (mouse_y_gui > (optionsY + (2 * optionBottom / 10)) - optionOffset) && (mouse_y_gui < (optionsY + (3 * (optionBottom / 10)) - optionOffset)) optionsIndex = 2;
		if (mouse_y_gui > (optionsY + (3 * optionBottom / 10)) - optionOffset) && (mouse_y_gui < (optionsY + (4 * (optionBottom / 10)) - optionOffset)) optionsIndex = 3;
		if (mouse_y_gui > (optionsY + (4 * optionBottom / 10)) - optionOffset) && (mouse_y_gui < (optionsY + (5 * (optionBottom / 10)) - optionOffset)) optionsIndex = 4;
	
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
				if(global.templeCompleted)
				{
					SlideTransition(TRANS_MODE.GOTO, rNewHub);
				}
				else
				{
					SlideTransition(TRANS_MODE.GOTO, rTutorial);
				}
				break;
			case 1:
				global.mouse = 0;
				menuActive = false;
				break;
			case 2:
				game_end();
				break;
				
			case 3:
				SlideTransition(TRANS_MODE.GOTO, rLevelSelect);
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
				if(!global.music)
				{
					global.music = true;
					audio_play_sound(msc_Title,10,true);
				}
				else if(global.music) 
				{
					global.music = false;
					audio_stop_sound(msc_Title);
				}
				break;
			case 3:
				if(saveDeleteConfirm == 0)
				{
					saveDeleteConfirm++;
				}
				else if(saveDeleteConfirm == 1)
				{
					if(file_exists("saveData.ini")){
						file_delete("saveData.ini");
					}
					saveDeleteConfirm++;
				}
				else if(saveDeleteConfirm == 2)
				{
					// Do nothing
				}
				break;
			case 4:
				saveDeleteConfirm = 0;
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

// Update music toggle
if(global.music)
{
	options[2] = "Music: On";	
}
else
{
	options[2] = "Music: Off";	
}