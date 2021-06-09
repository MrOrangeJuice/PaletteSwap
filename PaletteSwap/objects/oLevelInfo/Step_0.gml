/// @description Display Info

// Make Info Bubble Bounce
vsp += 0.1 * vdir;
if(vsp > 1 || vsp < -1) vdir *= -1;
y = y + vsp;

PaletteAnimationSwap();