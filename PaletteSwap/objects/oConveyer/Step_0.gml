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

 
if(place_meeting(x,y-1,oPlayer) && ((oPlayer.key_left && !oPlayer.key_right) || (oPlayer.key_right && !oPlayer.key_left)) && sign(oPlayer.hsp) != sign(beltDirection) && !oPlayer.skidding)
{
	oPlayer.hsp += oPlayer.hsp / beltDirection + sign(beltDirection) * 0.25;
}
else if(place_meeting(x,y-1,oPlayer)) {
	oPlayer.hsp += beltDirection;
}

PaletteAnimationSwap();