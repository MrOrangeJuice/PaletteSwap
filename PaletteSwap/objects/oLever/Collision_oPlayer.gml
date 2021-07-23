/// @description Insert description here
// You can write your code in this editor
for (i = 0; i < ds_list_size(dependencies); i++){
		instance_destroy(ds_list_find_value(dependencies, i));
}

if(sprite_index == sLever)
{
	audio_play_sound(snd_Lever,5,false);	
}
sprite_index = sLeverOn;