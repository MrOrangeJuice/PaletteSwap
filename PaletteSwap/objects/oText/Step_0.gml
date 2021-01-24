/// @description Insert description here
// You can write your code in this editor
if(!global.paused){
key_space = keyboard_check_pressed(vk_space);
if (gamepad_button_check(0,gp_face3) || gamepad_button_check(4,gp_face3))
{
	key_space = 1;
}
lerpProgress += (1-lerpProgress) / 50;
textProgress += global.textSpeed;
global.textUp = true;
x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

if(key_space == 1){
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
		global.textUp = false;
		instance_destroy();
	}
	//if(textProgress >= messageLength){
	//	instance_destroy();	
	//}
}
}