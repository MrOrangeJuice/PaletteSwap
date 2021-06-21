/// @description Falling
// You can write your code in this editor
if (falling) {
	visible = true;
	vsp += grv;
	
	//collide with wall
	if (place_meeting(x, y, oWall)){
		//play aniation/ sound
		instance_destroy(self);
	}
	
	//collide with palette block
	if (place_meeting(x, y, oPaletteWall)){
		switch (global.color){
		case 1:
			//water entry
			vsp /= 1.3;
			break;
		default:
			//play aniation and sound
			instance_destroy(self);
			break;
		}
	}

	y += vsp;
}

PaletteAnimationSwap();

