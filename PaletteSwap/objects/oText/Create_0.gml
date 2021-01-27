/// @description Insert description here
// You can write your code in this editor

x1 = RES_W / 2;
y1 = RES_H - 70;
x2 = RES_W / 2;
y2 = RES_H;

x1Target = 0;
x2Target = RES_W;

lerpProgress = 0;
textProgress = 0;

//message = "Hey what's up loser";
global.textUp = true;
curResponseId = 0;
textList = ds_list_create();
startOfText = 1;
for(c = 0; c < string_length(message); c++){
	if(string_char_at(message, c) == "#"){
		ds_list_add(textList, string_copy(message, startOfText, c-startOfText));
		startOfText = c+1;
	}
	else if(c == string_length(message) - 1){
		ds_list_add(textList, string_copy(message, startOfText, c-startOfText+2));
	}
}
curResponse = ds_list_find_value(textList, 0);