/// @description Insert description here
// You can write your code in this editor
if (!displayed && room == rSRResults){
	displayed = true;
	
	//display results
	text = instance_create_layer(x,y,"instances",oText);
	pb = global.speedrunBests[srLevelID];
	
bigstring = "Time: " + string_format(finishedTime/room_speed, 0, 2) +"\n";
if (finishedTime < time2 && (pb > time2 || pb == -1)){
	global.gearTotal++;
	bigstring += "You beat the time of "+ string_format(time2/room_speed, 0, 2) + "!\n";
}
if (finishedTime < time1 && (pb > time1 || pb == -1)){
	global.gearTotal++;
	if(global.gearTotal == 26)
	{
		if (!steam_get_achievement("100"))
		{
			steam_set_achievement("100");
		}	
	}
	bigstring += "You beat the time of "+ string_format(time1/room_speed, 0, 2) + "!\n";
}
//srLevelID will be used to access speedrunBests array, and maybe other speedrun level specific things
if (finishedTime < pb || pb == -1){
	bigstring += "New personal best!";
	global.speedrunBests[srLevelID] = finishedTime;
}
else {
	bigstring += "Personal best: " + string_format(pb/room_speed, 0, 2) + ".";
}
text.textMessage = bigstring;
}

if (key_space){
	SlideTransition(TRANS_MODE.GOTO, rMomentumMotel);
	global.currentDoorId = srLevelID;
	global.useCurrentDoorSpawn = true;
	Save();
	instance_destroy(self);
}
