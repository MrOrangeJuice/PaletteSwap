/// @description Update physics
// You can write your code in this editor

if (!fixing){

//calc hsp
	hsp = sign(door.x - x);
	image_xscale = sign(x - door.x);

	//jump
	if (place_meeting(x+ (hsp * 8),y,oWall) && vsp == 0)
	{
		vsp -= 6;
	}
	
	//move
	vsp += grv;
	
	if (!place_meeting(x+hsp,y,oWall))
	{
		x += hsp;
	}

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	//fall
	y += vsp;
}