// ONLY RUN THIS SCRIPT IF A COLLISION HAS BEEN DETECTED
// ASSUME OBJECT 2 IS THE MOVING OBJECT/ WILL BE MOVED
function CalculateCollisionOverlap(object1, object2){	

	xOverlap = 0;
	yOverlap = 0;

	// Check horizontal direction.
	if (object1.x > object2.x) { //if object 1 is right of object 2
		xOverlap = object1.bbox_left - object2.bbox_right; //this will be negative
	}
	else { //object 2 is right of object 1
		xOverlap = object1.bbox_right - object2.bbox_left; //this will be positive
	}
	
	// Check vertical direction.
	if (object1.y > object2.y) { //object 1 is below object 2
		yOverlap = object1.bbox_top - object2.bbox_bottom; //this will be negative
	}
	else {
		yOverlap = object1.bbox_bottom - object2.bbox_top; //this will be positive
	}
	
	return [xOverlap, yOverlap]; //these will both be positive
}