/// @description Insert description here
// You can write your code in this editor
if (!triggered && !dormant && (other.bottomWall || (other.bottomPalette && global.color != 1)) && other.hsp == 0 && !other.isRolling) {
	triggered = true;
	SwapSprite(sNone);
	
	text = instance_create_layer(0,0,"FX",oText);
	text.isDialog = true;
	text.textMessage = textMessage;

	if (other.vsp < 0) other.vsp = 0;
} else if (!triggered && !dormant) {
	global.canControlTimer = 1;
	if (other.isDashing) DashReset();
}