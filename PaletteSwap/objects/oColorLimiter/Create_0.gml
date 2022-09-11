/// @description set color limit
// You can write your code in this editor
if(room == rHub || room == rSecret || room == rShack || room == rNewHub)
{
	if(global.allPalettesUnlocked)
	{
		global.color_limit = 4;	
	}
	else
	{
		global.color_limit = localLimit;	
	}
}

else
{
	global.color_limit = localLimit;
}