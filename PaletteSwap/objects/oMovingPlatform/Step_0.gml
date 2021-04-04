/// @description Insert description here
// You can write your code in this editor
if((goForward && x > curTargetX) || (!goForward && x < curTargetX)){
	goForward = !goForward;
	if(curTargetNum == 1){
		curTargetNum = 2;
		curTargetX = target2X;
		curTargetY = target2Y;
	}
	else{
		curTargetNum = 1;
		curTargetX = target1X;
		curTargetY = target1Y;
	}
	xDiff = curTargetX - x;
	yDiff = curTargetY - y;
	xPercent = abs(xDiff) / (abs(xDiff) + abs(yDiff));
	yPercent = 1 - xPercent;
	if(xDiff < 0){
		xPercent *= -1;
	}
	if(yDiff < 0){
		yPercent *= -1;
	}
	overallMoveX = xPercent * spd;
	overallMoveY = yPercent * spd;
}
x += overallMoveX;
y += overallMoveY;
if(place_meeting(x, y, oPlayer)){
	oPlayer.vsp = 0;
	oPlayer.x += overallMoveX * 2.3;
	oPlayer.y = y - 16;
}