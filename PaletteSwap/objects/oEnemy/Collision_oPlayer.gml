/// @description Handle Player Collision

if (other.dashdown)
{
	eHP -= 1;
		
	// Send player flying.
	InitiateKnockback(other, 0, -8);
		
	// Refresh player's dash.
	DashReset();
}
else if (other.isDashing)
{
	eHP -= 1;
		
	// Send player flying.
	InitiateKnockback(other, -10, -8);
		 
	// Refresh player's dash.
	DashReset();
}
else if (other.isRolling)
{
	eHP -= 1;
		
	// Send player flying.
	InitiateKnockback(other, 0, -8);
		
	// Refresh player's dash.
	DashReset();
} 
// If the player is not dashing, then knock them back and begin their iframes.
else 
{
	// Damage and knockback the player if they're vulnerable.
	if (!other.isInvulnerable) 
	{
		global.hp -= damage;
		other.isInvulnerable = true;
			
		InitiateKnockback(other, 6, -7);
			
		global.knockedBack = true;
	}
}