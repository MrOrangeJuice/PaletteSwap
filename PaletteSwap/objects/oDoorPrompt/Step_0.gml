/// @description Switch Input and Palette
if (global.controller)
{
	sprite_index = sDoorPromptController;
}
else
{
	sprite_index = sDoorPrompt;
}

//update frame
PaletteAnimationSwap();