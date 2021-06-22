/// @description Initialize variables
currentframe = 0;
collected = false;
if(room == rPaletteTemple)
{
	if(global.templeGearArray[gid])
	{
		collected = true;
	}
}
if(room == rAlexLevel)
{
	if(global.seasideGearArray[gid])
	{
		collected = true;
	}
}

if(collected)
{
	sprite_index = sCollectibleBlacked;	
}