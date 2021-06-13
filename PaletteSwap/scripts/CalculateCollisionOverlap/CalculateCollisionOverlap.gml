// ONLY RUN THIS SCRIPT IF A COLLISION HAS BEEN DETECTED
// ASSUME OBJECT 2 IS THE MOVING OBJECT
function CalculateCollisionOverlap(object1, object2, isLeft, isDown){	

	xOverlap = 0;
	yOverlap = 0;

	// Check horizontal direction.
	if (isLeft) {
		xOverlap = object1.bbox_right - object2.bbox_left;
	}
	else {
		xOverlap = object1.bbox_left - object2.bbox_right;
	}
	
	// Check vertical direction.
	if (isDown) {
		yOverlap = object1.bbox_top - object2.bbox_bottom;
	}
	else {
		yOverlap = object1.bbox_bottom - object2.bbox_top;
	}
	
	return [xOverlap, yOverlap];
}