/// @description Checking key presses
menuIndex += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
if(menuIndex < 0){
	menuIndex = buttonCount - 1;	
}
else if(menuIndex > buttonCount - 1){
	menuIndex = 0;	
}
lastSelected = menuIndex;