/// @description Insert description here
// You can write your code in this editor
if(!global.isEnteringDoor){
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
		switch(levelTo)
		{
			case "MainMenu":
				info.levelName = "Finish Demo";
				break;
			case "rThanks":
				info.levelName = "Finish Demo\nBut Cooler";
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
		global.canControlTimer = room_speed * 3;
		oPlayer.exiting = true;
		with (oPlayer){
			SwapSprite(sFernRunNew);
		}
	}
}

//delayed exiting sequence
if (oPlayer.exiting && abs(oPlayer.x - x) <= 1.5 && abs(oPlayer.y - y) <= 20 && oPlayer.bottomWall){
	oPlayer.currentwalksp = 0;
	oPlayer.isDashing = false;
	oPlayer.exiting = false;
	if (oPlayer.vsp < 0) oPlayer.vsp = 0;
	with (oPlayer) SwapSprite(sFernPortalReverse);
	global.isEnteringDoor = true;
	audio_play_sound(snd_PortalEnter,5,false);
		global.color = 0;
		if(set_player_spawn){
			global.currentDoorId = doorId;
			global.useCurrentDoorSpawn = true;
		}
		Save();
		alarm[0] = room_speed * .3;
} else if (oPlayer.exiting && place_meeting(x,y,oPlayer) && abs(oPlayer.x - x) > 1.5) {
	oPlayer.image_xscale = sign(x - oPlayer.x); 
	oPlayer.hsp = sign(x - oPlayer.x) * 3;
}
}
PaletteAnimationSwap();