/// @description Insert description here
// You can write your code in this editor

// Play crab death sound on death.
if (eHP <= 0)
{
	audio_play_sound(snd_CrabDeath, 5, false);
}

// Inherit the parent event
event_inherited();