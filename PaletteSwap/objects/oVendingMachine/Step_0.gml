/// @description Insert description here
// You can write your code in this editor

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
		info = instance_create_layer(x,y-96,"Portals",oVendingInfo);
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

if(global.vendingGearsCollected < global.vendingGears)
{
	if(place_meeting(x,y,oPlayer) && key_enter && global.coins >= 200)
	{
		global.coins -= 200;
		global.gearTotal++;
		global.vendingGearsCollected++;
		audio_play_sound(snd_Collectible,5,false);
		Save();
	}
}

PaletteAnimationSwap();