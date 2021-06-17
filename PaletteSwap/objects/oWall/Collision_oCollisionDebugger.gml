/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

intersection = CalculateCollisionOverlap(self, other);

if (abs(intersection[0]) > abs(intersection[1]) ) {// if y offset is less than x offset
	//if (intersection[1] != 0){
		other.y += intersection[1];
		while (!place_meeting(other.x,other.y+sign(other.vsp), oWall))
			{
				other.y += sign(other.vsp);
			}
		other.vsp = 0;
	//}
}
else {
	//if (intersection[0] != 0){
		other.x += intersection[0];
		while (!place_meeting(other.x+sign(other.hsp),other.y, oWall))
			{
				other.x += sign(other.hsp);
			}
		other.currentwalksp = 0;
		other.hsp = other.currentwalksp;
	//}
}
