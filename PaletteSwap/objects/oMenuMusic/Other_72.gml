/// @description Insert description here
// You can write your code in this editor
if (audio_group_is_loaded(agMusic)) {
	audio_play_sound(msc_Title,10,true);
	audio_group_set_gain(agMusic, 0.4, 0);
}