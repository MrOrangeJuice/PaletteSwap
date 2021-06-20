/// @description Create
menuX = x+16;
menuY = y-5;
optionsX = x+336;
optionsY = y-20;
buttonHeight = 18;
button[0] = "Start";
button[1] = "Options";
button[2] = "Quit";
options[0] = "Fullscreen: Off";
options[1] = "Color Blind: Off";
options[2] = "Delete Save";
options[3] = "Back To Menu";
cam = view_camera[0];
buttonCount = array_length_1d(button);
optionCount = array_length_1d(options);
camDistance = 320;
camOffset = 0;
menuIndex = 0;
prevMenuIndex = 0;
optionsIndex = 0;
prevOptionIndex = 0;
menuActive = true;
lastSelected = 0;
lastAxis0Value = 0;
lastAxis4Value = 0;

// Mouse menu stuff
menuBottom = menuY + ((buttonHeight) * buttonCount);
optionBottom = optionsY + ((buttonHeight) * optionCount);
menuOffset = 12;
optionOffset = 6;