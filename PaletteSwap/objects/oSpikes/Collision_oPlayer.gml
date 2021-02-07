/// @description Insert description here
// You can write your code in this editor

if(hitTimer < 0){
	hitTimer = 5000000;
	global.hp -= 30;
	InitiateKnockback(oPlayer, 6, -7);
}