/// @description Drawing buttons out
var c = 0;
draw_set_font(fGame);
repeat(buttonCount){
	draw_set_halign(fa_center);
	// Draw shadow
	switch(global.color)
	{
		case 0:
			draw_set_color($37802A);
			break;
		case 1:
			draw_set_color($8C5F00);
			break;
	}
	if(menuIndex == c){
		switch(global.color)
		{
		case 0:
			draw_set_color($042700);
			break;
		case 1:
			draw_set_color($331800);
			break;
		}
	}
	draw_text_transformed(global.menuX, global.menuY + buttonHeight * c - 48.5, button[c],1.5,1.5,0);
	// Draw main text
	switch(global.color)
	{
		case 0:
			draw_set_color($45D1A5);
			break;
		case 1:
			draw_set_color($BEB900);
			break;
	}
	if(menuIndex == c){
		switch(global.color)
		{
			case 0:
				draw_set_color($37802A);
				break;
			case 1:
				draw_set_color($8C5F00);
				break;
		}
	}
	draw_text_transformed(global.menuX, global.menuY + buttonHeight * c - 50, button[c],1.5,1.5,0);
	c++;	
}