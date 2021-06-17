/// @description Create
global.menuX = 0;
global.menuY = 0;
buttonHeight = 32;
button[0] = "Resume";
//button[1] = "Save";
button[1] = "Menu";
button[2] = "Quit";
buttonCount = array_length_1d(button);
menuIndex = 0;
lastSelected = 0;
menuBottom = ((RES_H / 2) + ((buttonHeight) * buttonCount) - 50);
prevMenuIndex = 0;
menuOffset = -2;
instance_deactivate_object(oPauseButtons);