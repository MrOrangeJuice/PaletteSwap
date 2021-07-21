/// @description Collide with player

switch(global.color)
{
	case 0:
		beltDirection = -2;
		break;
	case 1:
		beltDirection = 2;
		break;
	case 2:
		beltDirection = -2;
		break;
	case 3:
		beltDirection = 2;
		break;
	default:
		beltDirection = -2;
		break;
}

if(place_meeting(x,y-1,oPlayer))
{
	oPlayer.x += beltDirection;
}

// Stop if too high or too low
if(goingUp && y == (originaly - 100))
{
	goingUp = false;	
}
if(!goingUp && y == originaly)
{
	goingUp = true;	
}

// Determine vertical direction
if(goingUp)
{
	vsp = -2;	
}
else
{
	
	vsp = 2;
}

// Apply vertical direction
y += vsp;

PaletteAnimationSwap();