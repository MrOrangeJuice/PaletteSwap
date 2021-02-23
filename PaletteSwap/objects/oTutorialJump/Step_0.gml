/// @description Switch Input and Palette
if (global.controller)
{
	sprite_index = sTutorialControllerJump;
}
else
{
	sprite_index = sTutorialKeyboardJump;
}

//update frame
PaletteAnimationSwap();