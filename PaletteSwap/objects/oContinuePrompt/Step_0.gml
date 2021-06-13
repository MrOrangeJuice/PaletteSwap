/// @description Swap Input

// Get input
key_enter = keyboard_check_pressed(ord("P"));

if (key_enter)
{
	global.controller = 0;
}

if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_enter = 1;
	global.controller = 1;
}

if(key_enter)
{
	SlideTransition(TRANS_MODE.GOTO, MainMenu);	
}

if(global.controller == 1)
{
	sprite_index = sContinuePromptController;	
}
else
{
	sprite_index = sContinuePrompt;	
}