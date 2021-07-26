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

if ((gamepad_axis_value(4,gp_axislv) > 0.4 && global.lastAxislv4Value <= 0.4) || gamepad_button_check_pressed(4,gp_padd) || (gamepad_axis_value(0,gp_axislv) > 0.4 && global.lastAxislv0Value <= 0.4) || gamepad_button_check_pressed(0,gp_padd))
{
	key_down = 1;
	global.controller = 1;
}
if ((gamepad_axis_value(4,gp_axislv) < -0.4 && global.lastAxislv4Value >= -0.4) || gamepad_button_check_pressed(4,gp_padu) || (gamepad_axis_value(0,gp_axislv) < -0.4 && global.lastAxislv0Value >= -0.4) || gamepad_button_check_pressed(0,gp_padu))
{
	key_up = 1;
	global.controller = 1;
}

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