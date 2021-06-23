/// @description Grab villager
if(!collected) {
	other.villager = true;
	audio_play_sound(snd_Villager, 5, false);
	instance_destroy();
}
else {
	global.coins += 20;
	with (oGame) coinTextScale = 1.2;
	audio_play_sound(snd_Villager, 5, false);
	instance_destroy();
}