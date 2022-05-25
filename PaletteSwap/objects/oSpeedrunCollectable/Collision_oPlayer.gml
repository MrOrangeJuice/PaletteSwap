/// @description Insert description here
// You can write your code in this editor
text = instance_create_layer(x,y,"FX",oText);
bigstring = "Time: " + string_format(global.time/room_speed, 0, 2) +"\n";
if (global.time < time2 && (global.speedrunBests[srLevelID] > time2 || global.speedrunBests[srLevelID]==-1)){
	//award gear
	bigstring += "You beat the time of "+ string_format(time2/room_speed, 0, 2) + "!\n";
}
if (global.time < time1 && (global.speedrunBests[srLevelID] > time1 || global.speedrunBests[srLevelID]==-1)){
	//award gear
	bigstring += "You beat the time of "+ string_format(time1/room_speed, 0, 2) + "!\n";
}
//srLevelID will be used to access speedrunBests array, and maybe other speedrun level specific things
if (global.time < global.speedrunBests[srLevelID] || global.speedrunBests[srLevelID]==-1){
	bigstring += "New personal best!";
	global.speedrunBests[srLevelID] = global.time;
}
text.textMessage = bigstring;
spRun.done = true;