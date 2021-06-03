/// @description Move

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	hsp *= -1;
	//rollsp *= -1;
}

x = x + hsp;
image_angle += rollsp;

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