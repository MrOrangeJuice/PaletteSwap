/// @description Drawing buttons out
var c = 0;
repeat(buttonCount){
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	if(menuIndex == c){
		draw_set_color(c_green);
	}
	draw_text(global.menuX, global.menuY + buttonHeight * c - 50, button[c]);
	c++;	
}