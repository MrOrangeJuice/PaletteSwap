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
	key = keyboard_lastkey;
	switch(buttonAction){
		case 0:
			oPlayer.leftKey = key;
			break;
		case 1:
			oPlayer.rightKey = key;
			break;
		case 2:
			oPlayer.upKey = key;
			break;
		case 3:
			oPlayer.downKey = key;
			break;
		case 4:
			oPlayer.jumpKey = key;
			break;
		case 5:
			oPlayer.jumpAltKey = key;
			break;
		case 6:
			oPlayer.dashKey = key;
			break;
		case 7:
			oPlayer.dashAltKey = key;
			break;
		case 8:
			oPlayer.swapUpKey = key;
			break;
		case 9:
			oPlayer.swapUpAltKey = key;
			break;
		case 10:
			oPlayer.swapDownKey = key;
			break;
		case 11:
			oPlayer.swapDownAltKey = key;
			break;
		default:
			break;
	}
}