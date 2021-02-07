/// @description Switch Input and Palette
if (global.controller)
{
	sprite_index = sTutorialController;
}
else
{
	sprite_index = sTutorialKeyboard;
}

//update frame
PaletteAnimationSwap();