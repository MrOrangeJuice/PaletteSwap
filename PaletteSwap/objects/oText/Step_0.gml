/// @description Insert description here
// You can write your code in this editor
if(textMessage != "" && !started){
	started = true;
	for(c = 0; c < string_length(textMessage); c++){
		if(string_char_at(textMessage, c) == "#"){
			ds_list_add(textList, string_copy(textMessage, startOfText, c-startOfText));
			startOfText = c+1;
		}
		else if(c == string_length(textMessage) - 1){
			ds_list_add(textList, string_copy(textMessage, startOfText, c-startOfText+2));
		}
	}
	curResponse = ds_list_find_value(textList, 0);
}
if(!global.paused && started){

lerpProgress += (1-lerpProgress) / 50;
textProgress += global.textSpeed;
//global.textUp = true;
x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

if(key_space == 1){
	audio_play_sound(snd_Dialogue, 4, false);
	lerpProgress = 0;
	textProgress = 0;
	curResponseId++;
	if(curResponseId < ds_list_size(textList)){
		curResponse = ds_list_find_value(textList, curResponseId);
		var messageLength = string_length(curResponse);
		if(textProgress > 2){
			textProgress = messageLength;
		}
	}
	else{
		//global.textUp = false;
		oPlayer.canJump = false;
		instance_destroy();
	}
	//if(textProgress >= messageLength){
	//	instance_destroy();	
	//}
}
}