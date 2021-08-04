/// @description Handle Player Collision

if (other.dashdown || other.dashup)
{
	eHP -= 1;
		
	// Send player flying.
	InitiateKnockback(other, 0, -9);
		
	// Refresh player's dash.
	DashReset();
}
else if (other.isDashing)
{
	eHP -= 1;
	//consistency alignment
	launch = -7 + ((bbox_top - other.y) / 20);
	// Send player flying.
	InitiateKnockback(other, other.image_xscale * 6, launch);
		 
	// Refresh player's dash.
	DashReset();
}
else if (other.isRolling)
{
	eHP -= 1;
		
	// Send player flying.
	InitiateKnockback(other, other.hsp, -7);
		
	// Refresh player's dash.
	DashReset();
} 
// If the player is not dashing, then knock them back and begin their iframes.
else 
{
	// Damage and knockback the player if they're vulnerable.
	if (!other.isInvulnerable) 
	{
		audio_play_sound(snd_Damage, 5, false);
		global.hp -= damage;
		other.isInvulnerable = true;
			
		InitiateKnockback(other, other.image_xscale * -6, -7);
			
		global.knockedBack = true;
		other.isRolling = false;
	}
}