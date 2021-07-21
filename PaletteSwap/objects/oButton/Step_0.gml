/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y-1,oPhysicsCrate) && !pushed)
{
	pushed = true;
	sprite_index = sButtonPushed;	
	audio_play_sound(snd_Lever,5,false);
	instance_destroy(oButtonBlock);
}

PaletteAnimationSwap();