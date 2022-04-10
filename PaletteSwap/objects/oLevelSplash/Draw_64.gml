/// @description Insert description here
// You can write your code in this editor
if(out && xOffset != 128)
{
	xOffset += 8;
}

if(!out && xOffset != 0)
{
	xOffset -= 8;	
}

if(room == rPaletteTemple)
{
	switch(global.color)
	{
		case 0:
			draw_sprite(sLevelSplash1,0,544-xOffset,70);
			break;
		case 1:
			draw_sprite(sLevelSplash1,1,544-xOffset,70);
			break;
		case 2:
			draw_sprite(sLevelSplash1,2,544-xOffset,70);
			break;
		case 3:
			draw_sprite(sLevelSplash1,3,544-xOffset,70);
			break;
	}
}

if(room == rAlexLevel)
{
	switch(global.color)
	{
		case 0:
			draw_sprite(sLevelSplash2,0,544-xOffset,70);
			break;
		case 1:
			draw_sprite(sLevelSplash2,1,544-xOffset,70);
			break;
		case 2:
			draw_sprite(sLevelSplash2,2,544-xOffset,70);
			break;
		case 3:
			draw_sprite(sLevelSplash2,3,544-xOffset,70);
			break;
	}
}

if(room == rFactory)
{
	switch(global.color)
	{
		case 0:
			draw_sprite(sLevelSplash3,0,544-xOffset,70);
			break;
		case 1:
			draw_sprite(sLevelSplash3,1,544-xOffset,70);
			break;
		case 2:
			draw_sprite(sLevelSplash3,2,544-xOffset,70);
			break;
		case 3:
			draw_sprite(sLevelSplash3,3,544-xOffset,70);
			break;
	}
}