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

if(global.paused) beltDirection = 0;
 
if(place_meeting(x,y-1,oPlayer) && ((oPlayer.key_left && !oPlayer.key_right && oPlayer.hsp <= 0) || (oPlayer.key_right && !oPlayer.key_left && oPlayer.hsp >= 0)) && sign(oPlayer.currentwalksp) != sign(beltDirection) && !oPlayer.skidding)
{
	oPlayer.hsp += abs(oPlayer.hsp) / beltDirection + sign(beltDirection) * 0.25;
}
else if(place_meeting(x,y-1,oPlayer)) {
	oPlayer.hsp += beltDirection;
}


PaletteAnimationSwap();