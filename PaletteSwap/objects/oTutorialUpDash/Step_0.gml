/// @description Switch Input and Palette
if (global.controller)
{
	sprite_index = sTutorialControllerNoSwapUpDash;
}
else
{
	sprite_index = sTutorialKeyboardUpDash;
}

//update frame
PaletteAnimationSwap();