/// @description Stop falling and begin alarm
vsp = 0;
sprite_index = sShipDamaged;

if(!timerInit)
{
	audio_play_sound(snd_Explosion, 5, false);
	alarm[0] = room_speed;
	timerInit = true;
}