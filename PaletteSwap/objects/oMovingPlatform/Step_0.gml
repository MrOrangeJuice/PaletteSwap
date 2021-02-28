/// @description Insert description here
// You can write your code in this editor
if((goForward && x > curTargetX) || (!goForward && x < curTargetX)){
	show_debug_message("HERE");
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