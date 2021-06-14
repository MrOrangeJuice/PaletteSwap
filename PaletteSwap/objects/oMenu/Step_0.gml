/// @description Checking key presses
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_select = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P"));
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
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
			case 1:
				SlideTransition(TRANS_MODE.GOTO, rLevelSelect);
				break;
			case 2:
				menuActive = false;
				break;
			case 3:
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
				window_set_fullscreen(!window_get_fullscreen());
					break;
			case 1:
				if(file_exists("savedata.ini")){
					file_delete("savedata.ini");
				}
				break;
			case 2:
				menuActive = true;
				break;
			default:
				break;
		}
	}
	audio_play_sound(snd_MenuSelect,5,false);
}
if ((gamepad_axis_value(4,gp_axislv) > 0.4  && lastAxis4Value <= 0.4) || gamepad_button_check_pressed(4,gp_padd) || (gamepad_axis_value(0,gp_axislv) > 0.4  && lastAxis0Value <= 0.4) || gamepad_button_check_pressed(0,gp_padd))
{
	key_down = 1;
}
if ((gamepad_axis_value(4,gp_axislv) < -0.4 && lastAxis4Value >= -0.4) || gamepad_button_check_pressed(4,gp_padu) || (gamepad_axis_value(0,gp_axislv) < -0.4 && lastAxis0Value >= -0.4) || gamepad_button_check_pressed(0,gp_padu))
{
	key_up = 1;
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
	camOffset += 5;
	camera_set_view_pos(cam,(x-144) + camOffset,y-96);	
}

if(menuActive && (camOffset != 0))
{
	camOffset -= 5;
	camera_set_view_pos(cam,(x-144) + camOffset,y-96);
}