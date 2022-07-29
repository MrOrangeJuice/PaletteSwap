/// @description Play flip sound effect
audio_play_sound(snd_Flip, 5, false);
//enable dialog trigger
if (instance_exists(oDialogTrigger)) {
	instance_find(oDialogTrigger, 0).dormant = false;
}