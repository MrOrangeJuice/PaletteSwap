/// @description Insert description here
// You can write your code in this editor
intersection = CalculateCollisionOverlap(self, other);

if (abs(intersection[0]) > abs(intersection[1]) ) {// if y offset is less than x offset
	if (intersection[1] != 0){
		other.y += intersection[1];
	}
}
else {
	if (intersection[0] != 0){
		other.x += intersection[0];
	}
}
