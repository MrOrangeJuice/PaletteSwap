/// @description Switch Input and Palette
if (oPlayer.controller)
{
	sprite_index = sTutorialControllerNoSwap;
}
else
{
	sprite_index = sTutorialKeyboardNoSwap;
}

//update frame
PaletteAnimationSwap();