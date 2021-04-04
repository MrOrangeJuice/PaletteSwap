/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,oPlayer))
{
	if(!playerIn)
	{
		layer_set_visible("HiddenLayer", false);
		playerIn = true;	
	}
}
else if(playerIn){
	layer_set_visible("HiddenLayer", true);
	playerIn = false;
}