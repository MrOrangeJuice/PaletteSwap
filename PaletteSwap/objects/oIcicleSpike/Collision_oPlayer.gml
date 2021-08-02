/// @description Insert description here
// You can write your code in this editor
if ((global.color == 1 || falling) && !other.isInvulnerable){
	global.hp -= 20;
	other.isInvulnerable = true;
	if (other.hsp == 0) {
		InitiateKnockback(other, -4 * other.image_xscale, -6);
	}else{
		InitiateKnockback(other, -1 * other.hsp, -6);
	}
	global.knockedBack = true;
	other.isDashing = false;
	audio_play_sound(snd_Damage, 5, false);
}