/// @description Update Movement

// Check what direction this enemy is moving in.
if(!global.paused){
	
	// Update movement based-on the behavior type.
	switch (behavior)
	{
		case flyingType.hover:
			break;
		case flyingType.seek:
			break;
		case flyingType.backAndForth:
			x += moveSpeed * dcos(degDir);
			y += moveSpeed * dsin(degDir);
		
			if (abs(point_distance(x, y, x2, y2)) < 0.1)
			{
				moveSpeed *= -1;
			}
			else if (abs(point_distance(x, y, x1, y1)) < 0.1)
			{
				moveSpeed *= -1;
			}
			break;
	}
}

// Inherit the parent event
event_inherited();