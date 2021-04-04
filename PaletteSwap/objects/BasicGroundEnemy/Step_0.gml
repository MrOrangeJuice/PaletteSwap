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
	xMove = walkSpeed;
	if(!movingRight){
		xMove = -walkSpeed;
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

// Check for player collision.
if (place_meeting(x, y, oPlayer))
{
	player = instance_find(oPlayer, 0);
	if (player.dashdown == true)
	{
		eHP -= 1;
		
		// Send player flying.
		InitiateKnockback(player, 0, -8);
		
		// Refresh player's dash.
		DashReset();
	}
	else if (player.isDashing == true)
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
			player.isInvulnerable = true;
			
			audio_play_sound(snd_Damage, 5, false);
			
			InitiateKnockback(player, 6, -7);
			
			global.knockedBack = true;
		}
	}
}

// Check for enemy death.
if (eHP <= 0)
{
	audio_play_sound(snd_CrabDeath, 5, false);
	instance_deactivate_object(self);
}
}

// Animation
if (movingRight) {
	image_xscale = -1;
}
else
{
	image_xscale = 1;
}

PaletteAnimationSwap();