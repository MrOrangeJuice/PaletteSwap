/// @description Swap Palette and Spawn Prompt or Text

// Get input
key_enter = keyboard_check_released(ord("X"));
//key_space = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P"));

if (key_enter)
{
	global.controller = 0;
}

if (gamepad_button_check_released(0,gp_face4) || gamepad_button_check_released(4,gp_face4))
{
	key_enter = 1;
	global.controller = 1;
}

/*
if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_space = 1;
	global.controller = 1;
}*/

if(place_meeting(x, y, oPlayer))
{
	if(!createdPrompt)
	{
		prompt = instance_create_layer(x,y-24,"Coins",oNPCPrompt);
		createdPrompt = true;
	}
	if(key_enter && !createdText)
	{
		audio_play_sound(snd_Interact, 5, false);
		text = instance_create_layer(x,y,"FX",oText);	
		createdText = true;
		text.textMessage = signMessage;
	}
}
else
{
	if(createdPrompt)
	{
		instance_destroy(prompt);
		createdPrompt = false;
	}
}

if(createdText && !instance_exists(text))
{
	createdText = false;
}


PaletteAnimationSwap();