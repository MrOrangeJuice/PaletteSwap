/// @description Insert description here
// You can write your code in this editor
currentframe = 0;
pushForce = 9;
requiredDistance = 160;
sideMod = 0;
if (flipSide){
	sideMod = 180;
}
vertMod = 0;
if (flipVert){
	vertMod = 180;
}
myAir = instance_create_layer(x, y, "BlownAir", oBlownAir);