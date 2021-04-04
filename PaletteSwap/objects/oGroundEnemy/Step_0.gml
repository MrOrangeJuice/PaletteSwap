/// @description Update Movement

// Check what direction this enemy is moving in.
if(!global.paused && !global.textUp){
	if (movingRight == true)
	{
		x = x + moveSpeed;
	}
	else 
	{
		x = x - moveSpeed;
	}

	// Check for wall collision horizontally.
	if (place_meeting(x,y,oWall))
	{
		movingRight = !movingRight;
		vsp = 0;
			
		/*
		// If the enemy can jump, give it a vertical boost to act as a "jump"
		if (canJump == true && place_meeting(x, y - 80, oWall) == false)
		{
			vsp = -5;
		}
		// Otherwise, just change this enemy's direction.
		else 
		{
			movingRight = !movingRight;
			vsp = 0;
		}
		*/
	}

	// Calculate any verticle movement by adding gravity and checking collisions.
	vsp += grv;

	// Check for ledge collision horizontally and vertically if this enemy can't walk off the ledge.
	if (hasLedgeTurn == true) 
	{
		xMove = moveSpeed;
		if(!movingRight){
			xMove = -moveSpeed;
		}
		if (place_meeting(x + (xMove * 25), y + vsp, oWall) == false)
		{
			movingRight = !movingRight;
		}
	}

	if (place_meeting(x, y + vsp, oWall))
	{
		vsp = 0;
	}
	
	y = y + vsp;
}

// Inherit the parent event
event_inherited();