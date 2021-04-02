/// @description Insert description here
// You can write your code in this editor
if (!playerIn && place_meeting(x,y,oPlayer))
{
	layer_set_visible(layerId, false);
	playerIn = true;
}
else if(playerIn){
	layer_set_visible(layerId, true);
	playerIn = false;
}