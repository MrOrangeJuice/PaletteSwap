/// @description Update Movement

// Check what direction this enemy is moving in.
if(!global.paused && !global.textUp){
	
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
		
			if (x == x2 && y == y2)
			{
				moveSpeed *= -1;
			}
		
			if (x == x1 && y == y1)
			{
				moveSpeed *= -1;
			}
			break;
	}
}

// Inherit the parent event
event_inherited();