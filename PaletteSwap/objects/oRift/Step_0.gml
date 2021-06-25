/// @description Follow Player

PaletteAnimationSwapSingle();

if (instance_exists(oPlayer))
{
	x = oPlayer.x;
	y = oPlayer.y;
}	
else if (instance_exists(oPlayerDeath))
{
	x = oPlayerDeath.x;
	y = oPlayerDeath.y;	
}