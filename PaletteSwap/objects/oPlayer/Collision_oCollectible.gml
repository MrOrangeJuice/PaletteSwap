/// @description Insert description here
// You can write your code in this editor
audio_stop_sound(snd_Collectible);
audio_play_sound(snd_Collectible, 4, false);
if(other.collected)
{
	global.coins += 10;
	with (oGame) coinTextScale = 1.2;	
}
else
{
	global.gearTotal++;
	with (oGame) collectableTextScale = 1.2;
	if(room == rPaletteTemple)
	{
		global.templeGearArray[other.gid] = true;
	}
	if(room == rAlexLevel)
	{
		global.seasideGearArray[other.gid] = true;
	}
	if(room == rFactory)
	{
		global.factoryGearArray[other.gid] = true;	
	}
	if(global.gearTotal == 26)
	{
		if (!steam_get_achievement("100"))
		{
			steam_set_achievement("100");
		}	
	}
}
instance_destroy(other);