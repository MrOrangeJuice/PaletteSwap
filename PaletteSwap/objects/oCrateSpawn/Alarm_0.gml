/// @description Spawn Roll
if(instance_exists(oPlayer))
{
	if(point_distance(x,y,oPlayer.x,oPlayer.y) < 500)
	{
		newRoll = instance_create_layer(x,y + 32, "Enemies", oPhysicsCrate);
	}
}
alarm[0] = room_speed * 3;