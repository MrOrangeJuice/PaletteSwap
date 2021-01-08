/// @description Draw when paused.

// Draw the screen-darkening effect.
draw_set_color(c_black);
draw_set_alpha(0.5);

maxH = display_get_height();
maxW = display_get_height();

// Switch which UI object is active based-on what state the game is in.
if (global.paused == true)
{
	draw_rectangle(0, 0, maxW, maxH, 0);
	resume.visible = true;
	options.visible = true;
	exitGame.visible = true;
}

draw_set_alpha(1);