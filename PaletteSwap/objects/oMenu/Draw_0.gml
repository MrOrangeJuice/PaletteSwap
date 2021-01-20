/// @description Drawing buttons out
// You can write your code in this editor
var c = 0;
repeat(buttonCount){
	draw_set_halign(fa_center);
	draw_set_color($45D1A5);
	draw_set_font(fUI);
	if(menuIndex == c){
		draw_set_color($37802A);
	}
	//draw_text_transformed(menuX,menuY + buttonHeight * c * 4,button[c], 4, 4,0);
	draw_text(menuX, menuY + buttonHeight * c, button[c]);
	c++;	
}