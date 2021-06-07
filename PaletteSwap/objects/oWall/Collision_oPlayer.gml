/// @description Insert description here
// You can write your code in this editor

if (other.isDashing == true) {
	// Check if this is a horizontal or vertical dash.
	if (other.dashdown) {
		
	}
	else if (other.dashleft) {
		
	}
	else if (other.dashright) {
		
		
		// If you hit the ground, pop up and reenable dash
		currentwalksp = newHSP;
		hsp = currentwalksp;
		vsp = newVSP;
	}
	
	// Reset the player's dash.
	DashReset();
			
	// Play sound effect
	audio_play_sound(snd_Thud, 5, false);
	// Shake screen
	ScreenShake(1,5);
}
else {
	// First, determine Fern's direction so we know what way to stop him.
	
	// The case when Fern is moving horizontally.
	if (other.hsp != 0) {
		other.x -= other.hsp;
		other.hsp = 0;
		other.currentwalksp = 0;
		
	}
	
	// The case when Fern is moving vertically.
	if (other.vsp != 0) {
		other.y -= other.vsp;
		other.vsp = 0;
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