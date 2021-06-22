/// @description Insert description here
// You can write your code in this editor
draw_self();

if(global.vendingGearsCollected < global.vendingGears)
{
	draw_sprite(sVendingPrice,global.color,x,y+16);
}
else
{
	draw_sprite(sVendingOut,global.color,x,y+16);
}

// Draw Prompt
if(global.coins >= 200 && global.vendingGearsCollected < global.vendingGears)
{
	if (global.controller)
	{
		draw_sprite(sDoorPromptControllerNew,global.color,x,y+36);
	}
	else
	{
		draw_sprite(sDoorPromptNew,global.color,x,y+36);
	}
}