// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerDeath(_player){
	// Pause game.
	global.paused = true;
	
	// Wait for key input.
	if (keyboard_check_pressed(vk_anykey)) 
	{
		global.paused = false;
		
		// Move player to checkpoint.
		_player.x = global.lastCheckpointX;
		_player.y = global.lastCheckpointY;
	}
}