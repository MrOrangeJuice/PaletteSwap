// @description Insert description here
// You can write your code in this editor

// Play crab death sound on death.
if (eHP <= 0)
{
	instance_create_layer(x, y, "Enemies", oEnemyFX);
	audio_play_sound(snd_CrabDeath, 5, false);
}

// Inherit the parent event
event_inherited();