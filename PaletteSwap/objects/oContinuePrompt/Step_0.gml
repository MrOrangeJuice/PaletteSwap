/// @description Swap Input

// Get input
key_enter = global.continueRelease;


if(key_enter)
{
	audio_play_sound(snd_MenuSelect,5,false);
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