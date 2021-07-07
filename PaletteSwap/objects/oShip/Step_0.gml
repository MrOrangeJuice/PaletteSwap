/// @description Move Ship and check for turning back on collision

y = y + vsp;

if(playerCreated && !place_meeting(x,y,oPlayer))
{
	global.cutscene = false;
	instance_change(oShipCollision, true);
}