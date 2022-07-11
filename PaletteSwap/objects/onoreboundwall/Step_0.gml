/// @description Insert description here
// You can write your code in this editor
if (instance_exists(oPlayer)){
	isCol = false;
	with(instance_find(oPlayer,0)){
		//handle collision
		if (place_meeting(x + hsp,y,other))
				{
					DoCollision(other, false);
					currentwalksp = 0;
					other.isCol = true;
				}
		if (place_meeting(x,y + vsp,other))
				{
					DoCollision(other, true);
					other.isCol = true;
				}
		
		//stop dash if underwater
		if (other.isCol && swimming) {
			isDashing = false;
		}
	}
	
}