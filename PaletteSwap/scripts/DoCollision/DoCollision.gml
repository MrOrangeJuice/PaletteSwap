// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DoCollision(wallType, vert){
if (global.knockedBack == true && vert && vsp > 0)
{
	global.knockedBack = false;
}

 if (vert){
	 while (!place_meeting(x,y+sign(vsp),wallType))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
 }
 else{
	 while (!place_meeting(x+sign(hsp),y,wallType))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
		currentwalksp = 0;
 }
}