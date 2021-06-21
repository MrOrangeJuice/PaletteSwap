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
currentframe = 0;