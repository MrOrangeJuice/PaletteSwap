/// @description Init

if(instance_exists(oPlayer))
{
	if(x < oPlayer.x)
	{
		xdir = 1;	
	}
	else
	{
		xdir = -1;	
	}
	
	image_xscale = xdir;
}

event_inherited();
xdir = 1;
playerSeen = false;
image_index = global.color * (sprite_get_number(sprite_index) / global.color_count);