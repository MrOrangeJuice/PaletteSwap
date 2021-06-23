/// @description Palette
if(room == rAlexLevel)
{
	if(global.seasideCompleted) collected = true;	
}
if(room == rPaletteTemple)
{
	if(global.templeCompleted) collected = true;	
}

if(collected)
{
	sprite_index = sVillagerBlack;
}
else
{
	sprite_index = sVillager;	
}

PaletteAnimationSwap();