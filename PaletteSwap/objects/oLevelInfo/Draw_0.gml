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
draw_text(x, y-8, levelName);
if(global.gearTotal >= levelRequirement)
{
	// Draw gears
	switch(levelName)
	{
		case "Palette Shrine":
			startingX = 8 * (global.templeGears - 1);
			for(i = 0; i < global.templeGears; i++)
			{
				if(!global.templeGearArray[i]) draw_sprite(sGearSmallBlacked,global.color,x-startingX+(i*16),y+16);	
				if(global.templeGearArray[i]) draw_sprite(sGearSmall,global.color,x-startingX+(i*16),y+16);	
			}
			break;
		case "Seaside Glide":
			startingX = 8 * (global.seasideGears - 1);
			for(i = 0; i < global.seasideGears; i++)
			{
				if(!global.seasideGearArray[i]) draw_sprite(sGearSmallBlacked,global.color,x-startingX+(i*16),y+16);	
				if(global.seasideGearArray[i]) draw_sprite(sGearSmall,global.color,x-startingX+(i*16),y+16);	
			}
			break;
	}
	// Draw Prompt
	if (global.controller)
	{
		draw_sprite(sDoorPromptControllerNew,global.color,x,y+36);
	}
	else
	{
		draw_sprite(sDoorPromptNew,global.color,x,y+36);
	}
}
else
{
	// Draw required gears
	draw_sprite(sGearSmall,global.color,x-10,y+16);
	if(global.color == 0)
	{
		DrawSetText($002704, fUI, 0, 0);
	}
	if(global.color == 1)
	{
		DrawSetText($001833, fUI, 0, 0);
	}
	draw_set_halign(fa_center);
	gearString = "x" + string(levelRequirement);
	draw_text(x+10, y+12, gearString);
}
