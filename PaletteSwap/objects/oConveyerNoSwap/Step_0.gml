/// @description Collide with player

if(place_meeting(x,y-1,oPlayer))
{
	oPlayer.x += beltDirection;
}