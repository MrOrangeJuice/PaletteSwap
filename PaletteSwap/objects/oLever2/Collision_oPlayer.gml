/// @description Insert description here
// You can write your code in this editor
instance_destroy(oLeverBlock2);
if(sprite_index == sLever)
{
	audio_play_sound(snd_Lever,5,false);	
}
sprite_index = sLeverOn;