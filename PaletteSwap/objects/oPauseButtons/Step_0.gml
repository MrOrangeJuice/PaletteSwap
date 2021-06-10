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
		global.paused = !global.paused;
		oPlayer.canJump = false;
		oScreenDarken.visible = false;
		//instance_activate_all();
		instance_deactivate_object(oPauseButtons);
		break;
	case 1:
		global.color = 0;
		global.coinId = 0;
		global.loaded = false;
		global.coinsDestroyed = false;
		ds_list_clear(global.coinArrX);
		ds_list_clear(global.coinArrY);
		ds_list_clear(global.loadCoinsX);
		ds_list_clear(global.loadCoinsY);
		global.color_limit = 2;
		audio_stop_sound(msc_Level);
		audio_stop_sound(msc_Seaside);
		SlideTransition(TRANS_MODE.GOTO, MainMenu);
		break;
	case 2:
		game_end();
		break;
	default:
		break;
	}
	audio_play_sound(snd_MenuSelect,5,false);
}

if ((gamepad_axis_value(4,gp_axislv) > 0.4 && global.lastAxislv4Value <= 0.4) || gamepad_button_check_pressed(4,gp_padd) || (gamepad_axis_value(0,gp_axislv) > 0.4 && global.lastAxislv0Value <= 0.4) || gamepad_button_check_pressed(0,gp_padd))
{
	key_down = 1;
	controller = 1;
}
if ((gamepad_axis_value(4,gp_axislv) < -0.4 && global.lastAxislv4Value >= -0.4) || gamepad_button_check_pressed(4,gp_padu) || (gamepad_axis_value(0,gp_axislv) < -0.4 && global.lastAxislv0Value >= -0.4) || gamepad_button_check_pressed(0,gp_padu))
{
	key_up = 1;
	controller = 1;
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
global.lastAxislv0Value = gamepad_axis_value(0,gp_axislv);
global.lastAxislv4Value = gamepad_axis_value(4,gp_axislv);