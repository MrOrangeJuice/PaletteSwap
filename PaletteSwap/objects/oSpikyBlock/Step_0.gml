/// @description Move

vsp = vsp + grv;
if(vsp > 8)
{
	vsp = 8;	
}

// Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

if(place_meeting(x,y+1,oConveyerNoSwapRight) && !global.paused)
{
	hsp = 2;
}
else if(place_meeting(x,y+1,oConveyerNoSwapLeft) && !global.paused)
{
	hsp = -2;
}
else if(place_meeting(x,y+1,oConveyer))
{
	hsp = oConveyer.beltDirection;
}
else
{
	// Decay hsp
	if(hsp != 0 && hsp > 0)
	{
		hsp -= 0.5;
	}
	if(hsp != 0 && hsp < 0)
	{
		hsp += 0.5;
	}
}

x += hsp;

PaletteAnimationSwap();