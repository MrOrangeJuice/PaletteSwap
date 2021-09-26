/// @description Insert description here
// You can write your code in this editor
if (triggered){
	//update tracker and upkeep
	if (key_space) dialogTracker++;
	//loop dialog order
	if (dialogTracker >= array_length_1d(dialogOrder)) dialogTracker = 0;
	
	if (array_length_1d(talkingEntities) > 0 && array_length_1d(dialogOrder) > 0){
//set faces and names to display
	//index dialogOrder to tracker, which you
	//then use to index talkingEntities,
	//reference their icon and name
	talkingEntity = talkingEntities[dialogOrder[dialogTracker]];
	face = talkingEntity.face;
	eName = talkingEntity.eName;
	}
	
	//cleanup and prevent retriggering
	if (!instance_exists(text)){
		instance_destroy(self);
	}
}