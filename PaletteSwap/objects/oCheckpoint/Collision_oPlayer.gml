/// @description Insert description here
// You can write your code in this editor
global.lastCheckpointX = x;
global.lastCheckpointY = y;

if(!active)
{
	audio_play_sound(snd_Checkpoint, 5, false);	
	// Restore Health
	global.hp = 100;
}

active = true;