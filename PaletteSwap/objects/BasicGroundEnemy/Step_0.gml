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

// Check for ledge collision horizontally and vertically if this enemy can't walk off the ledge.
if (ledgeTurn == true) 
{
	if (place_meeting(x + 10, y + vsp, oWall) == false)
	{
		movingRight = !movingRight;
	}
}

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
		
		// Send player flying.
		InitiateKnockback(player, -10, -8);
		
		// Refresh player's dash.
		DashReset();
	}
	else if (player.isRolling == true)
	{
		eHP -= 1;
		
		// Send player flying.
		InitiateKnockback(player, 0, -8);
		
		// Refresh player's dash.
		DashReset();
	}
	// If the player is not dashing, then knock them back and begin their iframes.
	else 
	{
		// Damage and knockback the player if they're vulnerable.
		if (player.isInvulnerable == false) 
		{
			global.hp -= damage;
			
			// Check for death
			if (global.hp <= 0) 
			{
				PlayerDeath(player);
			}
			player.isInvulnerable = true;
			
			InitiateKnockback(player, 6, -7);
		}
	}
}

// Check for enemy death.
if (eHP <= 0)
{
	instance_deactivate_object(self);
}
}