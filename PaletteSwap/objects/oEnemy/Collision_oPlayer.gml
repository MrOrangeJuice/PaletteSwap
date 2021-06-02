/// @description Handle Player Collision

player = instance_find(oPlayer, 0);
if (player.dashdown)
{
	eHP -= 1;
		
	// Send player flying.
	InitiateKnockback(player, 0, -8);
		
	// Refresh player's dash.
	DashReset();
}
else if (player.isDashing)
{
	eHP -= 1;
		
	// Send player flying.
	InitiateKnockback(player, -10, -8);
		 
	// Refresh player's dash.
	DashReset();
}
else if (player.isRolling)
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
	if (!player.isInvulnerable) 
	{
		global.hp -= damage;
		player.isInvulnerable = true;
			
		InitiateKnockback(player, 6, -7);
			
		global.knockedBack = true;
	}
}