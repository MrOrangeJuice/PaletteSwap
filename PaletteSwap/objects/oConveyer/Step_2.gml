/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y-1,oPlayer)) {
	with (oPlayer){
	if (key_left && !key_right && currentwalksp == 0) {
		x--;
	}

	if (!key_left && key_right && currentwalksp == 0) {
		x++;
	}
	}
}