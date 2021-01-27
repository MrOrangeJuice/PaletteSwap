// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InitiateKnockback(_object)
{
	// First off determine what object is getting knocked-back.
	if (_object.object_index == oPlayer.object_index) 
	{
		// Next, determine what direction the player is facing.
		if(_object.image_xscale == 1)
		{
			_object.currentwalksp = -6;	
		}
		else if(_object.image_xscale == -1)
		{
			_object.currentwalksp = 6;
		}
	
		// Finally apply knockback to the player.
		_object.hsp = _object.currentwalksp;
		_object.vsp = -7;
	}
	
}