/// @description Switch Input and Palette
if(!oPlayer.villager)
{
	sprite_index = sDoorPromptNo;
}
else {
	if (global.controller)
	{
		sprite_index = sDoorPromptController;
	}
	else
	{
		sprite_index = sDoorPrompt;
	}
}

//update frame
PaletteAnimationSwap();