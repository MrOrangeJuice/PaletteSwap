/// @description Insert description here
// You can write your code in this editor
if (!triggered) {
	triggered = true;
	text = instance_create_layer(0,0,"FX",oText);
	text.textMessage = textMessage;
}