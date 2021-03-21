/// @description Check for sprite

if(global.lastCheckpointX == x && global.lastCheckpointY == y)
{
	sprite_index = sCheckpoint;	
}
else
{
	sprite_index = sCheckpointInactive;	
	active = false;
}

PaletteAnimationSwap();