/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (eHP <= 0){
	audio_play_sound(snd_BirdDeath, 4, false);
	instance_create_layer(x, y, "Enemies", oBirdRespawner);
}
event_inherited();

