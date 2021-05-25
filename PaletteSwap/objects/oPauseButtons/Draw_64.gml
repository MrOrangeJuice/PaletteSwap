/// @description Drawing buttons out
var c = 0;
draw_set_alpha(1.0);
repeat(buttonCount){
	draw_set_halign(fa_center);
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
	draw_text(global.menuX, global.menuY + buttonHeight * c - 50, button[c]);
	c++;	
}