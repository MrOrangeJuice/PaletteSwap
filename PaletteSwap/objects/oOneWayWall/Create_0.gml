/// @description Insert description here
// You can write your code in this editor
playerRef = instance_find(oPlayer, 0);
dirVert = false;
dir = dcos(image_angle);
if (abs(dsin(image_angle))){
	dirVert = true;
	dir = dsin(image_angle);
}