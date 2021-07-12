/// @description Insert description here
// You can write your code in this editor

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
}

image_xscale = xdir;

if(instance_exists(oPlayer))
{
	if(point_distance(x,y,oPlayer.x,oPlayer.y) < 200)
	{
		if(!playerSeen)
		{
			alarm[0] = room_speed * 0.5;
		}
		playerSeen = true;
	}
	else
	{
		playerSeen = false;	
	}
}


// Check for enemy death.
if (eHP <= 0)
{
	instance_create_layer(x, y, "Enemies", oEnemyFX);
	audio_play_sound(snd_BirdDeath, 5, false);
	instance_destroy();
}

PaletteAnimationSwap();