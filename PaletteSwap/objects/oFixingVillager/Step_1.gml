/// @description Update physics
// You can write your code in this editor

if (!fixing){

//calc hsp
	hsp = sign(door.x - x);
	image_xscale = sign(x - door.x);

	//horizontal
	if (place_meeting(x+ (hsp * 8),y,oWall) && vsp == 0)
	{
		vsp -= 6;
	}
	//jump
	else if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
	//move
	x += hsp;
	vsp += grv;

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