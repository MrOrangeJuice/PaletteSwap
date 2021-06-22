/// @description Init
visible = false;
if(room == rPaletteTemple)
{
	if(global.templeCompleted)
	{
		visible = true;	
	}
}
if(room == rAlexLevel)
{
	if(global.seasideCompleted)
	{
		visible = true;	
	}
}
if(room == rSecret)
{
	visible = true;	
}
image_speed = 0;
currentframe = 0;