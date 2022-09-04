/// @description Draw Filled Gear 2

if(finishedTime < time2)
{
	draw4 = true;
	audio_play_sound(snd_PlayerDamage,5,false);
	switch(srLevelID)
	{
		case 0:
			global.speedrun1GearArray[1] = true;
			break;
		case 1:
			global.speedrun2GearArray[1] = true;
			break;
		case 2:
			global.speedrun3GearArray[1] = true;
			break;
	}
}