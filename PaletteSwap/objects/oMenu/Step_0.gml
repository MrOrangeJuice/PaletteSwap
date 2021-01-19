/// @description Checking key presses
key_down = keyboard_check_pressed(ord("S"));
key_up = keyboard_check_pressed(ord("W"));
key_enter = keyboard_check_pressed(vk_enter);
if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_enter = 1;
}
if(key_enter == 1){
	switch(menuIndex){
	case 0:
	room_goto(rTestDrew);
		break;
	case 1:
		game_end();
		break;
	default:
		break;
}
}
if ((gamepad_axis_value(4,gp_axislv) > 0.4  && lastAxis4Value <= 0.4) || gamepad_button_check_pressed(4,gp_padd) || (gamepad_axis_value(0,gp_axislv) > 0.4  && lastAxis0Value <= 0.4) || gamepad_button_check_pressed(0,gp_padd))
{
	key_down = 1;
}
if ((gamepad_axis_value(4,gp_axislv) < -0.4 && lastAxis4Value >= -0.4) || gamepad_button_check_pressed(4,gp_padu) || (gamepad_axis_value(0,gp_axislv) < -0.4 && lastAxis0Value >= -0.4) || gamepad_button_check_pressed(0,gp_padu))
{
	key_up = 1;
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