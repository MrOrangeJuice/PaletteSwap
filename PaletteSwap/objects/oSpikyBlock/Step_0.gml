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

if(place_meeting(x,y+1,oConveyer))
{
	x += oConveyer.beltDirection;
}

if(place_meeting(x,y+1,oConveyerNoSwapRight))
{
	x += 2;
}

if(place_meeting(x,y+1,oConveyerNoSwapLeft))
{
	x -= 2;
}

PaletteAnimationSwap();