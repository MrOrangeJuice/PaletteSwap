/// @description Insert description here
// You can write your code in this editor

// Draw Coin Count
coinTextScale = max(coinTextScale * 0.95, 1);
DrawSetText($002704, fUI, fa_right, fa_top);
draw_text_transformed(RES_W-2,3,"Coins *" + string(global.coins), coinTextScale, coinTextScale,0);

// Draw Time
timeTextScale = max(timeTextScale * 0.95, 1);
DrawSetText($002704, fUI, fa_right, fa_top);
draw_text_transformed(RES_W-2,12,"Time: " + string_format((global.time / room_speed), 0, 2), timeTextScale, timeTextScale,0);