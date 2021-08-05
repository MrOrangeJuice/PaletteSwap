/// @description Switch Input and Palette
if (global.controller)
{
	sprite_index = sTutorialControllerNoSwapDownDash;
}
else
{
	sprite_index = sTutorialKeyboardDownDash;
}

//update frame
PaletteAnimationSwap();