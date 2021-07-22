/// @description Insert description here
// You can write your code in this editor
if ((global.color == 1 || falling) && !other.isInvulnerable){
	global.hp -= 20;
	other.isInvulnerable = true;
	InitiateKnockback(other, -1 * other.vsp, -6);
	global.knockedBack = true;
	audio_play_sound(snd_Damage, 5, false);
}