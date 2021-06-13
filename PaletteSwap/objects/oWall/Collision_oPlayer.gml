/// @description Insert description here
// You can write your code in this editor

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
	isDown = false;
	
	// The case when Fern is moving right.
	if (other.hsp < 0) {
		isLeft = true;
		other.hsp = 0;
		other.currentwalksp = 0;
	}
	
	// The case when Fern is moving vertically.
	if (other.vsp < 0) {
		isDown = true;
		other.vsp = 0;
	}
	
	intersections = CalculateCollisionOverlap(self, other, isLeft, isDown);
	xOverlap = intersections[0];
	yOverlap = intersections[1];
	
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

	// Restore ability to variably jump once the bounce hits its apex
	if (vsp > 0)
	{
		jumpVar = true;	
	}
	// Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		DoCollision(oWall, false);
		currentwalksp = 0;
	}
	//collision with palette walls
	if (place_meeting(x+hsp,y,oPaletteWall))
	{
		switch (global.color){
			case 0:
			//walking through water
				DoCollision(oPaletteWall, false);
				currentwalksp = 0;
			break;
			case 1:
				//currentwalksp /= 1.2;
				hsp /= 2;
			break;
		}
	}
	x = x + hsp;

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		DoCollision(oWall, true);
	}
	// palette wall Collision
	if (place_meeting(x,y+vsp,oPaletteWall))
	{
		switch (global.color){
			case 0:
			//collide and not swimming
				DoCollision(oPaletteWall, true);
				swimming = false;
			break;
			case 1:
				vsp /= 1.25;
				swimming = true;
			break;
		}
	}
	else{
		swimming = false;
	}
	y = y + vsp;
}