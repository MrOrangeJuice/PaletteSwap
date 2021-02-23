/// @description Checking key presses
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_select = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P"));
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
}
if(key_select == 1){
	switch(menuIndex){
	case 0:
		SlideTransition(TRANS_MODE.GOTO, rTestJulien);
		break;
	case 1:
		if(file_exists(SAVEFILE)){
			show_debug_message("HERE");
			global.loaded = true;
			ini_open(SAVEFILE);
			global.loadX = ini_read_real("Vars", "playerX", 0);
			global.loadY = ini_read_real("Vars", "playerY", 0);
			global.loadHp = ini_read_real("Vars", "hp", 100);
			global.loadCoins = ini_read_real("Vars", "coins", 0);
			global.loadTime = ini_read_real("Vars", "time", 0);
			index = 0;
			while(true){
				curX = ini_read_real("Coins", "coinX" + string(index), 0);
				if(curX == -69420666){
					break;
				}
				curY = ini_read_real("Coins", "coinY" + string(index), 0);
				ds_list_add(global.loadCoinsX, curX);
				ds_list_add(global.loadCoinsY, curY);
				index++;
			}
			ini_close();
		}
		SlideTransition(TRANS_MODE.GOTO, rTest);
		break;
	case 2:
		if(file_exists(SAVEFILE)){
			file_delete(SAVEFILE);
		}
		break;
	case 3:
		window_set_fullscreen(!window_get_fullscreen());
		break;
	case 4:
		global.color_limit = 1;
		SlideTransition(TRANS_MODE.GOTO, rTutorial);
		break;
	case 5:
		game_end();
		break;
	default:
		break;
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
menuIndex += key_down - key_up;
if(menuIndex < 0){
	menuIndex = buttonCount - 1;	
}
else if(menuIndex > buttonCount - 1){
	menuIndex = 0;	
}
lastSelected = menuIndex;
lastAxis0Value = gamepad_axis_value(0, gp_axislv);
lastAxis4Value = gamepad_axis_value(4, gp_axislv);