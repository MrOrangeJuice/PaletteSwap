/// @description Switch Input and Palette
if(!oPortal.visible)
{
	sprite_index = sDoorPromptNo;
}
else {
	if (global.controller)
	{
		sprite_index = sDoorPromptControllerNew;
	}
	else
	{
		sprite_index = sDoorPromptNew;
	}
}

//update frame
PaletteAnimationSwap();