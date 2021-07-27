/// @description Swap Palette
//update frame
if(point_distance(x,y,oPlayer.x,oPlayer.y) < 16)
{
	angle = arctan2(oPlayer.y - y, oPlayer.x - x);
	hsp += cos(angle);
	vsp += sin(angle);
}

x += hsp;
y += vsp;

if (hsp > 0) hsp--;
if (vsp > 0) vsp--;
PaletteAnimationSwap();