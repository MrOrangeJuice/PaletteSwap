/// @description Player Hover

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

// Render prompt
if(place_meeting(x, y, oPlayer) && oPortal.visible)
{
	if(!prompt)
	{
		oDoorPrompt.visible = true;	
		prompt = true;	
	}
	if(key_enter)
	{
		global.color = 0;
		global.hp = 100;
		audio_play_sound(snd_PortalEnter,5,false);
		if(room == rPaletteTemple)
		{
			global.templeCompleted = true;
			audio_stop_sound(msc_Level);
		}
		if(room == rAlexLevel)
		{
			global.seasideCompleted = true;
			audio_stop_sound(msc_Seaside);
		}
		Save();
		SlideTransition(TRANS_MODE.GOTO, next_room);	
	}
}
else if(place_meeting(x, y, oPlayer))
{
	if(!prompt)
	{
		oDoorPrompt.visible = true;	
		prompt = true;	
	}
}
else
{
	if(prompt)
	{
		oDoorPrompt.visible = false;
		prompt = false;
	}
}


PaletteAnimationSwap();