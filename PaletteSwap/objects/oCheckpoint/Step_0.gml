/// @description Check for sprite

if(global.lastCheckpointX == x && global.lastCheckpointY == y)
{
	sprite_index = sCheckpoint2;	
}
else
{
	sprite_index = sCheckpointInactive;	
	active = false;
}

PaletteAnimationSwap();