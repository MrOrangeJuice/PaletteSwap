/// @description Draw Black Bars

if (mode != TRANS_MODE.OFF)
{
	if (global.color == 0)
	{
		draw_set_color($002704);
	}
	if (global.color == 1)
	{
		draw_set_color($331800);
	}
	draw_rectangle(0,0,w,percent*h_half,false);
	draw_rectangle(0,h,w,h-(percent*h_half),false);
}