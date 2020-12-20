/// @description Draw Coin Count
coinTextScale = max(coinTextScale * 0.95, 1);
DrawSetText($002704, fUI, fa_right, fa_top);
draw_text_transformed(RES_W-2,3,"Coins *" + string(global.coins), coinTextScale, coinTextScale,0);
