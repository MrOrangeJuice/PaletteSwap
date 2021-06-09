/// @description Draw Level Name

// Draw sprite
draw_self();
// Draw level name
if(global.color == 0)
{
	DrawSetText($002704, fUI, 0, 0);
}
if(global.color == 1)
{
	DrawSetText($001833, fUI, 0, 0);
}
draw_set_halign(fa_center);
draw_text(x, y, levelName);
// Draw gears
switch(levelName)
{
	case "Palette Shrine":
		startingX = 8 * (global.templeGears - 1);
		for(i = 0; i < global.templeGears; i++)
		{
			if(global.templeGearsCollected < (i+1)) draw_sprite(sGearSmallBlacked,global.color,x-startingX+(i*16),y+24);	
			if(global.templeGearsCollected >= (i+1)) draw_sprite(sGearSmall,global.color,x-startingX+(i*16),y+24);	
		}
		break;
	case "Seaside Glide":
		startingX = 8 * (global.seasideGears - 1);
		for(i = 0; i < global.seasideGears; i++)
		{
			if(global.seasideGearsCollected < (i+1)) draw_sprite(sGearSmallBlacked,global.color,x-startingX+(i*16),y+24);	
			if(global.seasideGearsCollected >= (i+1)) draw_sprite(sGearSmall,global.color,x-startingX+(i*16),y+24);	
		}
		break;
}