/// @description Insert description here
// You can write your code in this editor
global.color = 0;
global.isSpeedrun = false;
//create persistent results ferrying object
res = instance_create_layer(0, 0, "Player", oSRResults);
res.time1 = time1;
res.time2 = time2;
res.srLevelID = srLevelID;
res.finishedTime = global.time;

SlideTransition(TRANS_MODE.GOTO, rSRResults);

//stop extra collisions lol
instance_destroy(self);