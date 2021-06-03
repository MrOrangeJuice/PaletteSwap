// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DoDashCollision(wallType, newVSP, newHSP, vert){
	
	if (vert){
			while (!place_meeting(x,y+sign(vsp), wallType))
			{
				y = y + sign(vsp);
			}
	}
	else {
		while (!place_meeting(x+sign(hsp),y, wallType))
			{
				x = x + sign(hsp);
			}
	}
			// If you hit the ground, pop up and reenable dash
			//if (global.color == 0){
				currentwalksp = newHSP;
				hsp = currentwalksp;
				vsp = newVSP;
			//}

			// Reset the player's dash.
			DashReset();
			
			// Play sound effect
			audio_play_sound(snd_Thud, 5, false);
			// Shake screen
			ScreenShake(1,5);
}