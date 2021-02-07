// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DashReset()
{
	player = instance_find(oPlayer, 0);
	
	isDashing = false;
	isRolling = true;
	
	alarm[0] = room_speed * 0.15;
	dashtime = room_speed * 0.25;
	
	// Reset dash direction
	dashdown = false;
	dashleft = false;
	dashright = false;
	
	// DIsable variable jump
	jumpVar = false;
	airborne = true;
}