/// @description Switch Input and Palette
if (global.controller)
{
	sprite_index = sTutorialControllerNoSwapDash;
}
else
{
	sprite_index = sTutorialKeyboardDash;
}

//update frame
PaletteAnimationSwap();