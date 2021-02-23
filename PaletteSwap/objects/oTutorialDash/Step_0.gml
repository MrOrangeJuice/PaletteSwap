/// @description Switch Input and Palette
if (global.controller)
{
	sprite_index = sTutorialControllerDash;
}
else
{
	sprite_index = sTutorialKeyboardDash;
}

//update frame
PaletteAnimationSwap();