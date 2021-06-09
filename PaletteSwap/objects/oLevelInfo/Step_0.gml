/// @description Display Info

// Make Info Bubble Bounce
vsp += 0.05 * vdir;
if(vsp > 0.5 || vsp < -0.5) vdir *= -1;
y = y + vsp;

PaletteAnimationSwap();