/// @description Draw when paused.

// Switch which UI object is active based-on what state the game is in.
if (global.paused == true)
{
	// Draw the screen-darkening effect.
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	maxH = display_get_height();
	maxW = display_get_height();
	draw_rectangle(0, 0, maxW, maxH, 0);
	
	resume.visible = true;
	exitGame.visible = true;
	options.visible = true;
}
else 
{
	resume.visible = false;
	exitGame.visible = false;
	options.visible = false;
}