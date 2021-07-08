/// @description Move Ship and check for turning back on collision

y = y + vsp;

if(playerCreated && !place_meeting(x,y,oPlayer))
{
	instance_change(oShipCollision, true);
}