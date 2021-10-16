/// @description Update visuals and check for entry

// Get input
key_enter = keyboard_check_pressed(ord("X"));

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
		info.levelName = levelTo;
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

// Actually change level here.
if (abs(oPlayer.x - x) <= 1.5 && oPlayer.bottomWall && (key_enter || global.controller)){
	if (oPlayer.vsp < 0) oPlayer.vsp = 0;
	global.color = 0;
	Save();
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
		case "rSecret":
			audio_stop_sound(msc_Hub);
			SlideTransition(TRANS_MODE.GOTO, rSecret);
			break;
		case "rFactory":
			audio_stop_sound(msc_Hub);
			SlideTransition(TRANS_MODE.GOTO, rFactory);
			break;
		case "rMomentumMotel":
			audio_stop_sound(msc_Hub);
			SlideTransition(TRANS_MODE.GOTO, rMomentumMotel);
			break;
		case "rShack":
			audio_stop_sound(msc_Hub);
			SlideTransition(TRANS_MODE.GOTO, rShack);
			break;
	}
}