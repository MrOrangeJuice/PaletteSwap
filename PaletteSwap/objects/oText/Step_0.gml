/// @description Insert description here
// You can write your code in this editor
key_space = keyboard_check_pressed(vk_space);
if (gamepad_button_check(0,gp_face3) || gamepad_button_check(4,gp_face3))
{
	key_space = 1;
}
lerpProgress += (1-lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

if(key_space == 1){
	var messageLength = string_length(message);
	if(textProgress >= messageLength){
		instance_destroy();	
	}
	else{
		if(textProgress > 2){
			textProgress = messageLength;
		}
	}
	global.textUp = false;
}