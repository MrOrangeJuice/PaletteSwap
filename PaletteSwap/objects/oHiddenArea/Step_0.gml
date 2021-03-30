/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,oPlayer))
{
	if(image_alpha >= .05){
		image_alpha -= .05;
	}
}
else if(image_alpha <= .95){
	image_alpha += .05;
}