/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sHorrorCutsceneEnd){
	global.paused = false;
	global.cutscene = false;
	if (!steam_get_achievement("horror"))
	{
		steam_set_achievement("horror");
	}
	instance_destroy(self);
}