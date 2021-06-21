/// @description Initailize variables
currentframe = 0;
visible = false;
if(!oPortal.visible)
{
	sprite_index = sDoorPromptNo;
}
else {
	if (global.controller)
	{
		sprite_index = sDoorPromptControllerNew;
	}
	else
	{
		sprite_index = sDoorPromptNew;
	}
}