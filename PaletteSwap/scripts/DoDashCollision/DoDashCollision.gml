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
			currentwalksp = newHSP;
			hsp = currentwalksp;
			vsp = newVSP;
			isDashing = false;
			isRolling = true;
			alarm[0] = room_speed * 0.15;
			dashtime = room_speed * 0.25;
			// Reset dash direction
			dashdown = false;
			dashleft = false;
			dashright = false;
			// Disable variable jump
			jumpVar = false;
			airborne = true;
			// Play sound effect
			audio_play_sound(snd_Thud, 5, false);
			// Shake screen
			ScreenShake(1,5);
}