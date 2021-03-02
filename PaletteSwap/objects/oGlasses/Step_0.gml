/// @description Physics and palette

vsp += grv;

if (place_meeting(x,y+vsp,oWall))
{
	DoCollision(oWall, true);
}

y = y + vsp;

//update frame
PaletteAnimationSwap();