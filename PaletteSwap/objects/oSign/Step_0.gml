/// @description Swap Palette and Spawn Prompt or Text

// Get input
key_enter = keyboard_check(ord("X"));

if (key_enter)
{
	global.controller = 0;
}

if (gamepad_button_check_pressed(0,gp_face4) || gamepad_button_check_pressed(4,gp_face4))
{
	key_enter = 1;
	global.controller = 1;
}

if(place_meeting(x, y, oPlayer))
{
	if(!createdPrompt)
	{
		prompt = instance_create_layer(x,y-24,"Portals",oNPCPrompt);
		createdPrompt = true;
	}
	if(key_enter)
	{
		text = instance_create_layer(x,y,"FX",oText);	
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


PaletteAnimationSwap();