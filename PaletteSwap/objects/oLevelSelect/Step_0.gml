/// @description Checking key presses
key_left = global.leftKeyPressed;
key_right = global.rightKeyPressed;
key_select = global.menuSelect;


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