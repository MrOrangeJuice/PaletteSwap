/// @description Insert description here
// You can write your code in this editor
absX = abs(oPlayer.x-x);
absY = abs(oPlayer.y-y);
switch(global.color){
	case 0:
		myAir.rotation = 180;
		myAir.x = x - requiredDistance;
		myAir.y = y;
		break;
	case 1:
		myAir.rotation = 0;
		myAir.x = x + 16;
		myAir.y = y;
		break;
	case 2:
		myAir.rotation = 270;
		myAir.x = x;
		myAir.y = y - requiredDistance;
	case 3:
		myAir.rotation = 90;
		myAir.x = x;
		myAir.y = y + 16;
		default:
			break;
}
if(absY < 16 && absX < requiredDistance){
	if(global.color == 0 && oPlayer.x < x){
		myAir.rotation = 180;
		myAir.x = x - requiredDistance;
		myAir.y = y;
		oPlayer.x -= pushForce * (1 - (absX / requiredDistance));
	}
	else if(global.color == 1 && oPlayer.x > x){
		myAir.rotation = 0;
		myAir.x = x + 16;
		myAir.y = y;
		oPlayer.x += pushForce * (1 - (absX / requiredDistance));
	}
}
if(absY < requiredDistance && absX < 16){
	if(global.color == 2 && oPlayer.y < y){
		oPlayer.y -= pushForce * (1 - (absY / requiredDistance));
	}
	else if(global.color == 3 && oPlayer.y > y){
		oPlayer.y += pushForce * (1 - (absY / requiredDistance));
	}
}