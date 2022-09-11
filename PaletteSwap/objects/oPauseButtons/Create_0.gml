/// @description Create
global.menuX = 0;
global.menuY = 0;
buttonHeight = 32;
if(room == rSpeedrun3 || room == rSpeedrun4 || room == rSpeedrun5)
{
	button[0] = "Resume";
	button[1] = "Restart";
	button[2] = "Hub";
}
else
{
	button[0] = "Resume";
	button[1] = "Menu";
	button[2] = "Quit";
}
buttonCount = array_length_1d(button);
menuIndex = 0;
lastSelected = 0;
menuBottom = ((RES_H / 2) + ((buttonHeight) * buttonCount) - 50);
prevMenuIndex = 0;
menuOffset = -2;
instance_deactivate_object(oPauseButtons);