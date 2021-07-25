/// @description Insert description here
// You can write your code in this editor
if(canCollide){
	global.wasDashReset = true;
	oPlayer.canDash = true;
	timer = room_speed * 3;
	visible = false;
	canCollide = false;
}