// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InitiateKnockback(_object, _xVel, _yVel)
{
	if (global.knockedBack){
		_object.isRolling = false;
	}
	// First off determine what object is getting knocked-back.
	if (_object.object_index == oPlayer.object_index) 
	{
		with (oPlayer){
		// Next, determine what direction the player is facing.
		if (currentwalksp == 0 && !dashdown && !dashup){
			currentwalksp = image_xscale * 6;
		} else {
			currentwalksp = _xVel;	
		}
	
		// Finally apply knockback to the player.
		hsp = currentwalksp;
		vsp = _yVel;
		alarm[1] = room_speed * 0.75;
		}
	}
}