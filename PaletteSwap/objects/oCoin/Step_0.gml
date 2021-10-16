/// @description Swap Palette
//update frame
if(instance_exists(oPlayer))
{
if(point_distance(x,y,oPlayer.x,oPlayer.y) < 20 && (!place_meeting(x,y,oPaletteWall) || global.color == 1))
{
	angle = arctan2(oPlayer.y - y, oPlayer.x - x);
	hsp += cos(angle) * 3;
	vsp += sin(angle) * 3;
}
}

x += hsp;
y += vsp;

if (abs(hsp) > 0) { hsp = (abs(hsp) - 0.3) * sign(hsp); }
if (abs(vsp) > 0) { vsp = (abs(vsp) - 0.3) * sign(vsp); }
if (abs (hsp) < 0.3) hsp = 0;
if (abs (vsp) < 0.3) vsp = 0;
PaletteAnimationSwap();