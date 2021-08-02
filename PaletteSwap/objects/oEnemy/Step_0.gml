/// @description Check for enemy death.

// Check for enemy death.
if (eHP <= 0)
{
	instance_deactivate_object(self);
}

// Animation
if (moveSpeed == 0){
	image_xscale = sign(oPlayer.x - x);
}
else if (moveSpeed < 0) {
	image_xscale = -1;
}
else
{
	image_xscale = 1;
}

PaletteAnimationSwap();