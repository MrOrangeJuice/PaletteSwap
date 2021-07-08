/// @description Fire
laser = instance_create_layer(x+(2*xdir),y,"FX",oLaser);
laser.xdir = xdir;
if(playerSeen)
{
	alarm[0] = room_speed * 2;
	alarm[1] = room_speed * 1;
}