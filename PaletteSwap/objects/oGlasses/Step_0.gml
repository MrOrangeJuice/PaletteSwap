/// @description Physics and palette

vsp += grv;

if (place_meeting(x,y+vsp,oWall))
{
	DoCollision(oWall, true);
}

y = y + vsp;

deathCount += (delta_time / 1000000);

if (deathCount >= deathTime)
{
	global.isDead = false;
	instance_change(oPlayer, true);
}

//update frame
PaletteAnimationSwap();