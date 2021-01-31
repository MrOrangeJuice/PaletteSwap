/// @description Create

#macro SAVEFILE "Save.ini"

menuX = x;
menuY = y;
buttonHeight = 16;
button[0] = "New Game";
button[1] = "Continue";
button[2] = "Fullscreen";
button[3] = "Tutorial";
button[4] = "Quit";
buttonCount = array_length_1d(button);
menuIndex = 0;
lastSelected = 0;
lastAxis0Value = 0;
lastAxis4Value = 0;