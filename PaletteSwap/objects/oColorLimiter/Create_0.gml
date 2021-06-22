/// @description set color limit
// You can write your code in this editor
if(room == rHub)
{
	if(global.allPalettesUnlocked)
	{
		global.color_limit = 4;	
	}
	else
	{
		global.color_limit = 2;	
	}
}
else if(room == rSecret)
{
	if(global.allPalettesUnlocked)
	{
		global.color_limit = 4;	
	}
	else
	{
		global.color_limit = 2;	
	}
}
else
{
	global.color_limit = localLimit;
}