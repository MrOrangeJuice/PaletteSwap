/// @description Checking key presses
key_down = global.downKeyPressed;
key_up = global.upKeyPressed;
key_select = global.menuSelect;

var mouse_y_gui = device_mouse_y_to_gui(0);

menuY = global.menuY - 50;

if(global.mouse)
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

if(key_select == 1){
	switch(menuIndex){
	case 0:
		global.paused = !global.paused;
		if(instance_exists(oPlayer)) oPlayer.canJump = false;
		oScreenDarken.visible = false;
		//instance_activate_all();
		instance_deactivate_object(oPauseButtons);
		break;
	case 1:
		if(room == rSpeedrun3 || room == rSpeedrun4 || room == rSpeedrun5)
		{
			SlideTransition(TRANS_MODE.GOTO, room);
		}
		else
		{
			global.color = 0;
			/*
			global.coinId = 0;
			global.loaded = false;
			global.coinsDestroyed = false;
			ds_list_clear(global.coinArrX);
			ds_list_clear(global.coinArrY);
			ds_list_clear(global.loadCoinsX);
			ds_list_clear(global.loadCoinsY);
			*/
			global.color_limit = 2;
			audio_stop_sound(msc_Level);
			audio_stop_sound(msc_Seaside);
			audio_stop_sound(msc_FactoryIntro);
			audio_stop_sound(msc_FactoryLoop);
			visible = false;
			global.hp = 100;
			global.textUp = false;
			SlideTransition(TRANS_MODE.GOTO, MainMenu);
		}
		break;
	case 2:
		if(room == rSpeedrun3 || room == rSpeedrun4 || room == rSpeedrun5)
		{
			global.color = 0;
			global.isSpeedrun = false;
			SlideTransition(TRANS_MODE.GOTO, rMomentumMotel);
		}
		else
		{
			game_end();
		}
		break;
	default:
		break;
	}
	audio_play_sound(snd_MenuSelect,5,false);
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