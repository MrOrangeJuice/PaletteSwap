/// @description Insert description here
// You can write your code in this editor
if(!file_exists("savedata.ini")){
	instance_create_layer(1104, 2304, "Player", oEddy);
	instance_create_layer(0, 0, "Player", oEddy);
	playerRef = instance_find(oPlayer, 0);
	playerRef.x = 32;
	playerRef.y = 1904;
	playerRef.canSwap = false;
	//alarm[0] = room_speed;
}