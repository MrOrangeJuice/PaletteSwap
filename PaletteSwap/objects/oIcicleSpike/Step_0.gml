/// @description Falling
// You can write your code in this editor
if (falling) {
	visible = true;
	vsp += grv;
	y += vsp;
	
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
			grv = 0.15;
			break;
		default:
			//play aniation and sound
			instance_destroy(self);
			break;
		}
		//reset gravity if exiting water
	} else if (grv = 0.15) grv = 3;
}

PaletteAnimationSwap();

