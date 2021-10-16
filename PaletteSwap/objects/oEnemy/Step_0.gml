/// @description Check for enemy death.

// Check for enemy death.
if (eHP <= 0)
{
	instance_deactivate_object(self);
}

if (!canHit && !(place_meeting(x, y, oPlayer) || place_meeting(x - (oPlayer.hsp * 2.5), y, oPlayer))) {
	canHit = true;
}

// Animation
if (moveSpeed == 0 && instance_exists(oPlayer)){
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