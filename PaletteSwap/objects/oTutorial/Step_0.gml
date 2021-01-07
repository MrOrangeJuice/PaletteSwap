/// @description Switch Input and Palette
if (oPlayer.controller)
{
	sprite_index = sTutorialController;
}
else
{
	sprite_index = sTutorialKeyboard;
}

//update frame
PaletteAnimationSwap();