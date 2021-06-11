/// @description Damage Player

// Damage and knockback the player if they're vulnerable.
if (!oPlayer.isInvulnerable) 
{
	audio_play_sound(snd_PlayerDamage, 5, false);
	global.hp -= damage;
	oPlayer.isInvulnerable = true;
			
	InitiateKnockback(oPlayer, 6, -7);
			
	global.knockedBack = true;
}