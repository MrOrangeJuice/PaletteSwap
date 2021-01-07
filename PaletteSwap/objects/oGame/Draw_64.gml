/// @description Draw GUI

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