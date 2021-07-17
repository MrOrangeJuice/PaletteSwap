/// @description Insert description here
// You can write your code in this editor
currentframe = 0;
playerRef = instance_find(oPlayer, 0);
dirVert = false;
dir = dcos(image_angle);
if (abs(dsin(image_angle))){
	dirVert = true;
	dir = dsin(image_angle);
}

blocked = false;
pBlocked = false;
if (place_meeting(x + dcos(image_angle) * 8, y - dsin(image_angle) * 8, oPaletteWall)){
	pBlocked = true;
}
else if (place_meeting(x + dcos(image_angle) * 8, y - dsin(image_angle) * 8, oAbstractWallBase)) {
	blocked = true;
}