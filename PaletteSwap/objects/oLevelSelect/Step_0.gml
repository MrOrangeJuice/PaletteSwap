/// @description Checking key presses
key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_down);
key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_up);
key_select = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P"));
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
}
if(key_select == 1)
{
	SlideTransition(TRANS_MODE.GOTO, asset_get_index(level[menuIndex]));
	audio_play_sound(snd_MenuSelect,5,false);
}
if ((gamepad_axis_value(4,gp_axislh) > 0.4  && lastAxis4Value <= 0.4) || gamepad_button_check_pressed(4,gp_padl) || (gamepad_axis_value(0,gp_axislh) > 0.4  && lastAxis0Value <= 0.4) || gamepad_button_check_pressed(0,gp_padl))
{
	key_left = 1;
}
if ((gamepad_axis_value(4,gp_axislh) < -0.4 && lastAxis4Value >= -0.4) || gamepad_button_check_pressed(4,gp_padr) || (gamepad_axis_value(0,gp_axislh) < -0.4 && lastAxis0Value >= -0.4) || gamepad_button_check_pressed(0,gp_padr))
{
	key_right = 1;
}

// Play sound
if(key_left || key_right)
{
	audio_play_sound(snd_Menu,5,false);	
}
menuIndex += key_left - key_right;
if(menuIndex < 0){
	menuIndex = levelCount - 1;	
}
else if(menuIndex > levelCount - 1){
	menuIndex = 0;	
}
lastSelected = menuIndex;
lastAxis0Value = gamepad_axis_value(0, gp_axislh);
lastAxis4Value = gamepad_axis_value(4, gp_axislh);