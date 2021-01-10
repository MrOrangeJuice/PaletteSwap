// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//updates sprite, needs currentframe
function SwapSprite(newSprite, slow){
	if (sprite_index != newSprite){
		if (!slow || floor(currentframe) != currentframe_floor){
			sprite_index = newSprite;
			currentframe = 0;
		}
	}
	currentframe_floor = floor(currentframe);
}