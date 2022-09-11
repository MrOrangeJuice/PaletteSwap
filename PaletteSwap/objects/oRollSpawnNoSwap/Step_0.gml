/// @description store alarms through pause
//if paused and no time stored, store the alarm's current time
if (global.paused && storeAlarm < 0){
	storeAlarm = alarm[0];
}
//if unpaused, replace the alarm's current time with the stored value and wipe it
else if (!global.paused && storeAlarm >= 0){
	alarm[0] = storeAlarm;
	storeAlarm = -1;
}
PaletteAnimationSwap();
