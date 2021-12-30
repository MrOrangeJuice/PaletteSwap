/// @description Player Hover

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

// Render prompt
if(place_meeting(x, y, oPlayer) && oPortal.visible)
{
	if(!prompt && !oPlayer.exiting)
	{
		oDoorPrompt.visible = true;	
		prompt = true;	
	}
	if(key_enter)
	{
		global.canControlTimer = room_speed * 3;
		oPlayer.exiting = true;
		with (oPlayer){
			SwapSprite(sFernRunNew);
		}
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

//delayed exiting sequence
if (instance_exists(oPlayer) && oPlayer.exiting && abs(oPlayer.x - x) <= 1.5 && oPlayer.bottomWall){
	oPlayer.currentwalksp = 0;
	oPlayer.isDashing = false;
	oPlayer.exiting = false;
	if (oPlayer.vsp < 0) oPlayer.vsp = 0;
	with (oPlayer) SwapSprite(sFernIdle2);
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
		if(room == rFactory)
		{
			global.factoryCompleted = true;
			audio_stop_sound(msc_FactoryIntro);
			audio_stop_sound(msc_FactoryLoop);
		}
		Save();
		SlideTransition(TRANS_MODE.GOTO, next_room);	
	}
else if (instance_exists(oPlayer) && oPlayer.exiting && place_meeting(x,y,oPlayer)  && abs(oPlayer.x - x) > 1.5) {
	oPlayer.image_xscale = sign(x - oPlayer.x);
	oPlayer.hsp = sign(x - oPlayer.x) * 3;	
}


PaletteAnimationSwap();