/// @description Insert description here
// You can write your code in this editor
timeSinceHit -= delta_time;
if (timeSinceHit < 0 && place_meeting(x, y, oPlayer))
{
	player = instance_find(oPlayer, 0);
	// If the player is not dashing, then knock them back and begin their iframes.
	// Damage the player.
	global.hp -= 30;
	InitiateKnockback(player);
	timeSinceHit = 500000;
}