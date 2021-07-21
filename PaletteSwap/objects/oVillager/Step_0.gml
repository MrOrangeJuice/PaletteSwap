/// @description Palette
if(room == rAlexLevel)
{
	if(global.seasideCompleted) collected = true;	
}
if(room == rPaletteTemple)
{
	if(global.templeCompleted) collected = true;	
}
if(room == rFactory)
{
	if(global.factoryCompleted) collected = true;	
}

if(collected)
{
	sprite_index = sVillagerBlack;
}
else
{
	sprite_index = sVillager;	
}

// Turn to look at player
if(x < oPlayer.x)
{
	image_xscale = -1;	
}
else
{
	image_xscale = 1;	
}

PaletteAnimationSwap();