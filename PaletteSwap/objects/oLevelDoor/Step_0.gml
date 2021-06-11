/// @description Update visuals and check for entry

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
	if(!createdInfo)
	{
		info = instance_create_layer(x,y-86,"Portals",oLevelInfo);
		switch(levelTo)
		{
			case "MainMenu":
				info.levelName = "Finish Demo";
				break;
			case "rThanks":
				info.levelName = "Finish Demo\nBut Cooler";
				break;
			case "rPaletteTemple":
				info.levelName = "Palette Shrine";
				break;
			case "rAlexLevel":
				info.levelName = "Seaside Glide";
				break;
		}
		info.levelRequirement = gearRequirement;
		createdInfo = true;
	}
}
else
{
	if(createdInfo)
	{
		instance_destroy(info);
		createdInfo = false;
	}
}

// if player has enough gears to enter
if(global.gearTotal >= gearRequirement)
{
	// Set portal to visible
	portal.visible = true;	
	if(place_meeting(x,y,oPlayer) && key_enter)
	{
		audio_play_sound(snd_PortalEnter,5,false);
		global.color = 0;
		switch(levelTo)
		{
			case "MainMenu":
				audio_stop_sound(msc_Level);
				SlideTransition(TRANS_MODE.GOTO, MainMenu);	
				break;
			case "rThanks":
				SlideTransition(TRANS_MODE.GOTO, rThanks);
				break;
			case "rPaletteTemple":
				SlideTransition(TRANS_MODE.GOTO, rPaletteTemple);	
				break;
			case "rAlexLevel":
				audio_stop_sound(msc_Level);
				SlideTransition(TRANS_MODE.GOTO, rAlexLevel);	
				break;
			default:
				SlideTransition(TRANS_MODE.GOTO, rHub);
				break;
		}
	}
}

PaletteAnimationSwap();