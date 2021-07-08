/// @description Insert description here
// You can write your code in this editor

if(x < oPlayer.x)
{
	xdir = 1;	
}
else
{
	xdir = -1;	
}

image_xscale = xdir;

if(instance_exists(oPlayer))
{
	if(point_distance(x,y,oPlayer.x,oPlayer.y) < 50)
	{
		if(!playerSeen)
		{
			alarm[0] = room_speed * 2;
			alarm[1] = room_speed * 1;
		}
		playerSeen = true;
	}
	else
	{
		playerSeen = false;	
	}
}

if(sprite_index == sGunWeaselFire)
{
	if(currentframe == 10)
	{
		sprite_index = sGunWeasel;
	}
}

PaletteAnimationSwap();