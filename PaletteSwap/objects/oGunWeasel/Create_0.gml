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

currentframe = 0;
xdir = 1;
playerSeen = false;