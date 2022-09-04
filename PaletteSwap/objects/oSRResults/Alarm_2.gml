/// @description Draw Filled Gear 1

if(finishedTime < time1)
{
	draw3 = true;
	audio_play_sound(snd_PlayerDamage,5,false);
	switch(srLevelID)
	{
		case 0:
			global.speedrun1GearArray[0] = true;
			break;
		case 1:
			global.speedrun2GearArray[0] = true;
			break;
		case 2:
			global.speedrun3GearArray[0] = true;
			break;
	}
}