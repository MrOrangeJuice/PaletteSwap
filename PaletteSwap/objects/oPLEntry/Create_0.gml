/// @description Insert description here
// You can write your code in this editor
if(!file_exists("savedata.ini")){
	instance_create_layer(1088, 2320, "Player", oEddy);
	playerRef = instance_find(oPlayer, 0);
	playerRef.x = 32;
	playerRef.y = 1984;
	playerRef.canSwap = false;
}