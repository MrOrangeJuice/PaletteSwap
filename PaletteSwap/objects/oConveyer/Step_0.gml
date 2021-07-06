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

PaletteAnimationSwap();