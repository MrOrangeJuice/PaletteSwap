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
DrawSetText($002704, fUI, 0, 0);
	if(file_exists(SAVEFILE)){
		ini_open(SAVEFILE);
		if(ini_read_real("Vars", "best", 0) == 0){
			draw_text(200, 150, "No high score");
		}
		else{
			draw_text_transformed(275, 5, "High Score:", .5, .5, 0);
			draw_text_transformed(275, 10, string_format(ini_read_real("Vars", "best", 0) / room_speed, 0, 2), .5, .5, 0);
		}
		ini_close();
	}