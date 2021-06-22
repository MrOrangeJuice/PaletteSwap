/// @description Insert description here
// You can write your code in this editor
visible = false;
global.allPalettesUnlocked = true;
if(!createdText)
{
	createdText = true;
	audio_play_sound(snd_Collectible,5,false);
	text = instance_create_layer(x,y,"FX",oText);	
	text.textMessage = "Congrats on beating the game! \n You now have access to the\nred and purple palettes\nin the hub area.";
}