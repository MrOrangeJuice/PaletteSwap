/// @description Insert description here
// You can write your code in this editor
global.tutorialCompleted = true;
//used for momentum motel and old shack
if (useDoorSpawn){
	global.currentDoorId = doorTo_ID;
	global.useCurrentDoorSpawn = true;
}
SlideTransition(TRANS_MODE.GOTO, next_room);