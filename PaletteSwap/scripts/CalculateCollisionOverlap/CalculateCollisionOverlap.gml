// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//assume 02 is the player
function CalculateCollisionOverlap(object1, object2){	

	xOverlap = 0.0;
	yOverlap = 0.0;
	
	// Check horizontal direction.
	if (object1.x > object2.x) { //if object 1 is right of object 2
		xOverlap = object1.bbox_left - object2.bbox_right - 1; //this will be negative
	}
	else { //object 2 is right of object 1
		xOverlap = object1.bbox_right - object2.bbox_left + 1; //this will be positive
	}
	
	// Check vertical direction.
	if (object1.y > object2.y) { //object 1 is below object 2
		yOverlap = object1.bbox_top - object2.bbox_bottom - 1; //this will be negative
	}
	else {
		yOverlap = object1.bbox_bottom - object2.bbox_top + 1; //this will be positive
	}
	
	//correct wide xoverlap
	temp = object2.bbox_right - object2.bbox_left;
	if (temp < abs(xOverlap)) xOverlap = sign(xOverlap) * temp;
	temp = object1.bbox_right - object1.bbox_left;
	if (temp < abs(xOverlap)) xOverlap = sign(xOverlap) * temp;
	
	//correct tall yoverlap
	temp = object2.bbox_bottom - object2.bbox_top;
	if (temp < abs(yOverlap)) yOverlap = sign(yOverlap) * temp;
	temp = object1.bbox_bottom - object1.bbox_top;
	if (temp < abs(yOverlap)) yOverlap = sign(yOverlap) * temp;
	
	return [xOverlap, yOverlap]; //these will both be positive
}
