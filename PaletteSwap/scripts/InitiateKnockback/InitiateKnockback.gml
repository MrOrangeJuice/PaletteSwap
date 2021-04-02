// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InitiateKnockback(_object, _xVel, _yVel)
{
	// First off determine what object is getting knocked-back.
	if (_object.object_index == oPlayer.object_index) 
	{
		// Next, determine what direction the player is facing.
		if(_object.image_xscale == -1)
		{
			_object.currentwalksp =  _xVel;	
		}
		else if(_object.image_xscale == 1)
		{
			_object.currentwalksp = -1 * _xVel;
		}
		
		global.knockedBack = true;
	
		// Finally apply knockback to the player.
		_object.hsp = _object.currentwalksp;
		_object.vsp = _yVel;
	}
}