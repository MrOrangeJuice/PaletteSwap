/// @description Insert description here
// You can write your code in this editor
if(room == rTutorial2)
{
	global.tutorialCompleted = true;
	if (!steam_get_achievement("tutorial"))
	{
		steam_set_achievement("tutorial");
	}
}
//used for momentum motel and old shack
if (useDoorSpawn){
	global.currentDoorId = doorTo_ID;
	global.useCurrentDoorSpawn = true;
	global.skipPortalAnimation = true;
}
SlideTransition(TRANS_MODE.GOTO, next_room);