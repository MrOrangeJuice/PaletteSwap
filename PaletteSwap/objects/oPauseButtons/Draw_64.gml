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
		case 2:
			draw_set_color($00189F);
			break;
		case 3:
			draw_set_color($B8208E);
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
		case 2:
			draw_set_color($00002B);
			break;
		case 3:
			draw_set_color($2C142D);
			break;
		}
	}
	draw_text_transformed(pauseMenuX/2, pauseMenuY/2 + buttonHeight * c - 48.5, button[c],1.5,1.5,0);
	// Draw main text
	switch(global.color)
	{
		case 0:
			draw_set_color($45D1A5);
			break;
		case 1:
			draw_set_color($BEB900);
			break;
		case 2:
			draw_set_color($3548F6);
			break;
		case 3:
			draw_set_color($FF7BEF);
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
			case 2:
				draw_set_color($00189F);
				break;
			case 3:
				draw_set_color($B8208E);
				break;
		}
	}
	draw_text_transformed(pauseMenuX/2, pauseMenuY/2 + buttonHeight * c - 50, button[c],1.5,1.5,0);
	c++;	
}