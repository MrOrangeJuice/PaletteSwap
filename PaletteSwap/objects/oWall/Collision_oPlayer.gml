/// @description Insert description here
// You can write your code in this editor

intersection = CalculateCollisionOverlap(self, other);

if (abs(intersection[0]) > abs(intersection[1]) ) {// if y offset is less than x offset
	if (intersection[1] != 0){
		other.y += intersection[1];
		other.vsp = 0;
	}
}
else {
	if (intersection[0] != 0){
		other.x += intersection[0];
		other.currentwalksp = 0;
		other.hsp = other.currentwalksp;
	}
}

/*
if (other.isDashing == true) {
	// Check if this is a horizontal or vertical dash.
	if (other.dashdown) {
		intersections = CalculateCollisionOverlap(self, other, false, true);
		xOverlap = intersections[0];
		yOverlap = intersections[1];
		
		// Change player's momentum.
		other.currentwalksp = 0;
		other.hsp = other.currentwalksp;
		other.vsp =  -11;
	}
	else if (other.dashleft) {
		intersections = CalculateCollisionOverlap(self, other, true, true);
		xOverlap = intersections[0];
		yOverlap = intersections[1];
		
		// Change player's momentum.
		other.currentwalksp = 6;
		other.hsp = other.currentwalksp;
		other.vsp =  -7;
	}
	else if (other.dashright) {
	
		intersections = CalculateCollisionOverlap(self, other, false, true);
		xOverlap = intersections[0];
		yOverlap = intersections[1];
		
		// Change player's momentum.
		other.currentwalksp = -6;
		other.hsp = other.currentwalksp;
		other.vsp =   -7;
	}
	
	// Apply overlap-offsets based-on given directions
	if (isLeft) {
		other.x += xOverlap;
	}
	else {
		other.x -= xOverlap;
	}
	
	if (isDown) {
		other.y += yOverlap;
	}
	else {
		other.y -= yOverlap;
	}
	
	// Reset the player's dash.
	DashReset();
			
	// Play sound effect
	audio_play_sound(snd_Thud, 5, false);
	// Shake screen
	ScreenShake(1,5);
}
else {
	// First, determine direction.
	isLeft = false;
	isDown = true;
	
	// The case when Fern is moving right.
	if (other.hsp < 0) {
		isLeft = true;
		other.hsp = 0;
		other.currentwalksp = other.hsp;
	}
	
	// The case when Fern is moving vertically.
	if (other.vsp < 0) {
		isDown = false;
		other.vsp = 0;
	}
	
	// Apply overlap-offsets based-on given directions
	if (isLeft) {
		//other.x += xOverlap;
		if (other.bbox_right - self.bbox_left > 0){
			other.x = self.bbox_left - (other.sprite_width / 2);
		}
	}
	else {
		//other.x -= xOverlap;
		if (other.bbox_left - self.bbox_right > 0){
			other.x = self.bbox_right + (other.sprite_width / 2);
		}
	}
	
	if (isDown) {
		//other.y += yOverlap /2;
		if (other.bbox_bottom - self.bbox_top > 0) {
			other.y = self.bbox_top - (other.sprite_height / 2);
		}
	}
	else {
		//other.y -= yOverlap /2;
		if (other.bbox_top - self.bbox_bottom > 0) {
			other.y = self.bbox_bottom + (other.sprite_height / 2);
		}
	}
	other.x += 0;
	other.y += 0;
	other.vsp += 0;
}
*/