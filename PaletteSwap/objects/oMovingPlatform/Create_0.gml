/// @description Insert description here
// You can write your code in this editor
curTargetX = target1X;
curTargetY = target1Y;
curTargetNum = 1;
overallMoveX = 0;
overallMoveY = 0;
goForward = true;
if(curTargetX < x){
	goForward = false;
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