/// @description Draw GUI

if(room != MainMenu && room != rLevelSelect && room != rThanks && room != rStickTest && room != rCredits && !global.textUp)
{
	// healthbar
	draw_sprite_stretched(sHealthBarBase, global.color, 4, 4, 64, 16);
	draw_sprite_stretched(sHealthbar, global.color, 5, 5, (global.hp / global.maxHP) * 60, 14);
	draw_sprite(sColorBlindDisplay, global.color, 4, 4);
	
	coinOffset = 0;
	// Draw Coin Count
	if(global.coins < 10)
	{
		coinOffset = 16;	
	}
	else if(global.coins < 100)
	{
		coinOffset = 8;	
	}
	else if(global.coins < 1000)
	{
		coinOffset = 0;	
	}
	else
	{
		coinOffset = -8;	
	}
	coinTextScale = max(coinTextScale * .95, 1);
	switch(global.color)
	{
		case 0:
			DrawSetText($002704, fUI, fa_right, fa_top);
			break;
		case 1:
			DrawSetText($331800, fUI, fa_right, fa_top);
			break;
		case 2:
			DrawSetText($00002B, fUI, fa_right, fa_top);
			break;
		case 3:
			DrawSetText($2C142D, fUI, fa_right, fa_top);
			break;
	}
	draw_sprite_stretched(sCoinStatic, global.color, 268 + coinOffset, 4, 16, 16);
	draw_text_transformed(RES_W-2,7,"*" + string(global.coins), coinTextScale, coinTextScale,0);
	
	switch(room)
	{
		case rPaletteTemple:
			startingX = 8 * (global.templeGears - 1);
			for(i = 0; i < global.templeGears; i++)
			{
				if(!global.templeGearArray[i]) draw_sprite(sGearSmallBlacked,global.color,gearHUDX-startingX+(i*16),gearHUDY);	
				if(global.templeGearArray[i]) draw_sprite(sGearSmall,global.color,gearHUDX-startingX+(i*16),gearHUDY);	
			}
			break;
		case rAlexLevel:
			startingX = 8 * (global.seasideGears - 1);
			for(i = 0; i < global.seasideGears; i++)
			{
				if(!global.seasideGearArray[i]) draw_sprite(sGearSmallBlacked,global.color,gearHUDX-startingX+(i*16),gearHUDY);	
				if(global.seasideGearArray[i]) draw_sprite(sGearSmall,global.color,gearHUDX-startingX+(i*16),gearHUDY);	
			}
			break;
		case rFactory:
			startingX = 8 * (global.factoryGears - 1);
			for(i = 0; i < global.factoryGears; i++)
			{
				if(!global.factoryGearArray[i]) draw_sprite(sGearSmallBlacked,global.color,gearHUDX-startingX+(i*16),gearHUDY);	
				if(global.factoryGearArray[i]) draw_sprite(sGearSmall,global.color,gearHUDX-startingX+(i*16),gearHUDY);	
			}
			break;
	}
	
	// Draw Collectable Count
	gearOffset = 0;
	if(global.gearTotal < 10)
	{
		gearOffset = 0;	
	}
	else
	{
		gearOffset = -8;	
	}
	collectableTextScale = max(collectableTextScale * 0.95, 1);
	switch(global.color)
	{
		case 0:
			DrawSetText($002704, fUI, fa_right, fa_top);
			break;
		case 1:
			DrawSetText($331800, fUI, fa_right, fa_top);
			break;
		case 2:
			DrawSetText($00002B, fUI, fa_right, fa_top);
			break;
		case 3:
			DrawSetText($2C142D, fUI, fa_right, fa_top);
			break;
			
	}
	draw_sprite_stretched(sGearSmall, global.color, 284 + gearOffset, 20, 16, 16);
	draw_text_transformed(RES_W-2,22,"*" + string(global.gearTotal), collectableTextScale, collectableTextScale,0);

	// Draw Time
	if (global.isSpeedrun){
		timeTextScale = max(timeTextScale * 0.95, 1);
		switch(global.color)
		{
			case 0:
				DrawSetText($002704, fUI, fa_right, fa_top);
				break;
			case 1:
				DrawSetText($331800, fUI, fa_right, fa_top);
				break;
		}
		draw_text_transformed(RES_W-2,37,"Time: " + string_format((global.time / room_speed), 0, 2), timeTextScale, timeTextScale,0);
	}
	// Draw Player HP
	/*
	hpTextScale = max(hpTextScale * 0.95, 1);
	switch(global.color)
	{
		case 0:
			DrawSetText($002704, fUI, fa_right, fa_top);
			break;
		case 1:
			DrawSetText($331800, fUI, fa_right, fa_top);
			break;
	}
	draw_text_transformed(RES_W-2,21,"HP: " + string(global.hp) + "/ " + string(global.maxHP), hpTextScale, hpTextScale,0);
	*/

	// Draw current palette color.
	switch(global.color)
	{
		case 0:
			DrawSetText($002704, fUI, fa_center, fa_top);
			break;
		case 1:
			DrawSetText($331800, fUI, fa_center, fa_top);
			break;
		case 2:
			DrawSetText($00002B, fUI, fa_center, fa_top);
			break;
		case 3:
			DrawSetText($2C142D, fUI, fa_center, fa_top);
			break;
	}
	
	currentColor = "";

	switch (global.color)
	{
		// The case for the green palatte.
		case 0:
			currentColor = "Green";
			break;
		// The case for the blue palatte.
		case 1:
			currentColor = "Blue";
			break;
		// The case for the red palatte.
		case 2:
			currentColor = "Red";
			break;
		// The case for the purple palatte.
		case 3:
			currentColor = "Purple";
			break;
	}
	
	if(global.colorblind)
	{
		draw_text_transformed(37, 8, string(currentColor), collectableTextScale, collectableTextScale, 0);
	}
	/*
	// Draw Currently Active Palette
	paletteTextScale = max(paletteTextScale * 0.95, 1);
	switch(global.color)
	{
		case 0:
			DrawSetText($002704, fUI, fa_right, fa_top);
			break;
		case 1:
			DrawSetText($331800, fUI, fa_right, fa_top);
			break;
	}
	draw_text_transformed(RES_W-2,30, currentColor, paletteTextScale, paletteTextScale,0);
	*/
}