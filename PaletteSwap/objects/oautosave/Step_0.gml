/// @description Animate

if(!goingBack)
{
	if(xOffset <= 16)
	{
		xOffset += 4;
	}
	else if(!alarmStarted)
	{
		alarm[0] = room_speed * 1;
		alarmStarted = true;
	}
}
else
{
	if(xOffset >= 0)
	{
		xOffset -= 4;
	}
	else
	{
		instance_destroy();
	}
}

PaletteAnimationSwap();