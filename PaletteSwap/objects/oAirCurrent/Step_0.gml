/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer)){
absX = abs(oPlayer.x-x);
absY = abs(oPlayer.y-y);
switch(global.color){
	case 0:
		myAir.image_angle = 0 + sideMod;
		myAir.x = x;
		myAir.y = y;
		break;
	case 1:
		myAir.image_angle = 180 + sideMod;
		myAir.x = x;
		myAir.y = y;
		break;
	case 2:
		myAir.image_angle = 270 + vertMod;
		myAir.x = x;
		myAir.y = y;
		break;
	case 3:
		myAir.image_angle = 90 + vertMod;
		myAir.x = x;
		myAir.y = y;
		break;
	default:
		break;
}
if(absY < 16 && absX < requiredDistance){
	//sign of the distance from air block to player matches the cos of the image angle (pos left, neg right)
	if(sign(x - oPlayer.x) == dcos(myAir.image_angle)){
		//push player away from air block based on image angle
		oPlayer.hsp -= dcos(myAir.image_angle) * pushForce * (1 - (absX / requiredDistance));
	}
}
if(absY < requiredDistance && absX < 16){
		if(sign(y - oPlayer.y) == dsin(myAir.image_angle)){
		oPlayer.vsp -= dsin(myAir.image_angle) * pushForce * (1 - (absY / requiredDistance));
	}
}
}
PaletteAnimationSwap();