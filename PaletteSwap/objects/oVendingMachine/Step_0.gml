/// @description Insert description here
// You can write your code in this editor

// Get input
key_enter = global.signKeyPress;


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
		if(global.gearTotal == 26)
		{
			if (!steam_get_achievement("100"))
			{
				steam_set_achievement("100");
			}	
		}
		audio_play_sound(snd_Collectible,5,false);
		Save();
	}
}

PaletteAnimationSwap();