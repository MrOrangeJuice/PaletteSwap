/// @description Insert description here
// You can write your code in this editor
if ((global.color == 1 || falling) && !other.isInvulnerable){
	global.hp -= 5;
	other.isInvulnerable = true;
	InitiateKnockback(other, -1 * other.vsp, -6);
	global.knockedBack = true;
}