/// @description Draw GUI

if(room != MainMenu)
{
	// Draw Coin Count
	coinTextScale = max(coinTextScale * 0.95, 1);
	switch(global.color)
	{
		case 0:
			DrawSetText($002704, fUI, fa_right, fa_top);
			break;
		case 1:
			DrawSetText($331800, fUI, fa_right, fa_top);
			break;
	}
	draw_text_transformed(RES_W-2,3,"Coins *" + string(global.coins), coinTextScale, coinTextScale,0);

	// Draw Time
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
	draw_text_transformed(RES_W-2,12,"Time: " + string_format((global.time / room_speed), 0, 2), timeTextScale, timeTextScale,0);

	// Draw Player HP
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

	// Draw current palette color.
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
}