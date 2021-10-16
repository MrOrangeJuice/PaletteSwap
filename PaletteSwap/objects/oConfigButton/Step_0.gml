/// @description Insert description here
// You can write your code in this editor
//buttonAction integers:
/*
0: Left
1: Right
2: Up
3: Down
4: Jump
5: JumpAlt
6: Dash
7: DashAlt
8: SwapUp
9: SwapUpAlt
10: SwapDown
11: SwapDownAlt
*/
if(GetHover() && !waitingForKey && mouse_check_button_pressed(mb_left)) {
	waitingForKey = true;
	io_clear();
}

if(keyboard_check_pressed(vk_anykey) && waitingForKey){
	waitingForKey = false;
	tempKey = global.asc_def[keyboard_lastkey];
	realKey = keyboard_lastkey;
	switch(buttonAction){
		case 0:
			global.leftKey = realKey;
			break;
		case 1:
			global.rightKey = realKey;
			break;
		case 2:
			global.upKey = realKey;
			break;
		case 3:
			global.downKey = realKey;
			break;
		case 4:
			global.jumpKey = realKey;
			break;
		case 5:
			global.jumpAltKey = realKey;
			break;
		case 6:
			global.dashKey = realKey;
			break;
		case 7:
			global.dashAltKey = realKey;
			break;
		case 8:
			global.swapUpKey = realKey;
			break;
		case 9:
			global.swapUpAltKey = realKey;
			break;
		case 10:
			global.swapDownKey = realKey;
			break;
		case 11:
			global.swapDownAltKey = realKey;
			break;
		default:
			break;
	}
}