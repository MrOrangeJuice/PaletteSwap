/// @description Update Movement

// Check what direction this enemy is moving in.
if(!global.paused){
	
	x = x + moveSpeed;

	// Check for wall collision horizontally.
	if (place_meeting(x,y,oWall))
	{
		moveSpeed *= -1;
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
		if (place_meeting(x + (moveSpeed * 25), y + vsp, oWall) == false)
		{
			moveSpeed *= -1;
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