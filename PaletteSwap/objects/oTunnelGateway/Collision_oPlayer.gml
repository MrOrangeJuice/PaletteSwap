/// @description Insert description here
// You can write your code in this editor
if(room == rTutorial2)
{
	global.tutorialCompleted = true;
}
//used for momentum motel and old shack
if (useDoorSpawn){
	global.currentDoorId = doorTo_ID;
	global.useCurrentDoorSpawn = true;
	global.skipPortalAnimation = true;
}
SlideTransition(TRANS_MODE.GOTO, next_room);