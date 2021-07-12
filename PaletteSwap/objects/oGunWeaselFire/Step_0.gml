/// @description Insert description here
// You can write your code in this editor
image_xscale = xdir;

if(currentframe == 8)
{
	audio_play_sound(snd_Laser,5,false);
	laser = instance_create_layer(x+(8*xdir),y-4,"FX",oLaser);
	laser.xdir = xdir;	
}
else if(currentframe == 10)
{
	instance_create_layer(x,y,"Enemies",oGunWeasel);
	instance_destroy();
}

// Check for enemy death.
if (eHP <= 0)
{
	instance_create_layer(x, y, "Enemies", oEnemyFX);
	audio_play_sound(snd_BirdDeath, 5, false);
	instance_destroy();
}



PaletteAnimationSwap();