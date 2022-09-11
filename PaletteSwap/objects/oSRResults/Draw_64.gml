/// @description Draw


if(draw1)
{
	draw_sprite(sCollectibleBlacked,0,128,80);
	draw_text(128,48,string_format(time1/room_speed, 0, 2));
}
if(draw2)
{
	draw_sprite(sCollectibleBlacked,0,192,80);
	draw_text(192,48,string_format(time2/room_speed, 0, 2));
}
if(draw3)
{
	draw_sprite(sCollectible,0,128,80);
}
if(draw4)
{
	draw_sprite(sCollectible,0,192,80);
}