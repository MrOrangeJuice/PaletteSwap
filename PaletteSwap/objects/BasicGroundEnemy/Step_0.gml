/// @description Move Enemy side-to-side

// Check what direction this enemy is moving in.
if(!global.paused && !global.textUp){
if (movingRight == true)
{
	x = x + walkSpeed;
}
else 
{
	x = x - walkSpeed;
}

// Check for wall collision horizontally.
if (place_meeting(x,y,oWall))
{
	movingRight = !movingRight;
	vsp = 0;
}

// Calculate any verticle movement by adding gravity and checking collisions.
vsp += grv;

if (place_meeting(x, y + vsp, oWall))
{
	vsp = 0;
}
	
y = y + vsp;

// Check for player collision.
if (place_meeting(x, y, oPlayer))
{
	player = instance_find(oPlayer, 0);
	if (player.isDashing == true)
	{
		eHP -= 1;
	}
	else 
	{
		global.hp -= damage;
	}
}

// Check for enemy death.
if (eHP <= 0)
{
	instance_deactivate_object(self);
}
}