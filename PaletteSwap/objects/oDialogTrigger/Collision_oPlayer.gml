/// @description Insert description here
// You can write your code in this editor
if (!triggered && !requiresActivation) {
	triggered = true;
	SwapSprite(sNone);
	visible = true;
	
	text = instance_create_layer(0,0,"FX",oText);
	text.isDialog = true;
	text.textMessage = textMessage;
	
	global.canControlTimer = 1;
	DashReset();
	oPlayer.currentwalksp = 0;
	if (oPlayer.vsp < 0) oPlayer.vsp = 0;
}