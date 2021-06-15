/// @description Drawing buttons out
// You can write your code in this editor
var c = 0;
repeat(buttonCount){
	draw_set_halign(fa_center);
	draw_set_color($45D1A5);
	draw_set_font(fGame);
	// Draw shadow text
	if(menuIndex == c) {
		draw_set_color($042700);
	}
	else {
		draw_set_color($37802A);
	}
	draw_text_transformed(menuX, menuY + buttonHeight * c + 1.5, button[c],1.5,1.5,0);
	// Draw normal text
	if(menuIndex == c) {
		draw_set_color($37802A);
	}
	else {
		draw_set_color($45D1A5);
	}
	draw_text_transformed(menuX, menuY + buttonHeight * c, button[c],1.5,1.5,0);
	c++;	
}

var d = 0;
repeat(optionCount){
	draw_set_halign(fa_center);
	draw_set_color($45D1A5);
	draw_set_font(fGame);
	// Draw shadow text
	if(optionsIndex == d) {
		draw_set_color($042700);
	}
	else {
		draw_set_color($37802A);
	}
	draw_text_transformed(optionsX, optionsY + buttonHeight * d + 1.5, options[d],1.5,1.5,0);
	// Draw normal text
	if(optionsIndex == d) {
		draw_set_color($37802A);
	}
	else {
		draw_set_color($45D1A5);
	}
	draw_text_transformed(optionsX, optionsY + buttonHeight * d, options[d],1.5,1.5,0);
	d++;	
}