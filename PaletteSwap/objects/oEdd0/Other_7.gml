/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sHorrorCutsceneEnd){
	global.paused = false;
	global.cutscene = false;
	instance_destroy(self);
}