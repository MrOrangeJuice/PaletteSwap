/// @description Insert description here
// You can write your code in this editor
triggered = false;
text = 0;
key_space = 0;
dialogTracker = 0;

//parse dialog order
startOfText = 0;
dialogOrder = ds_list_create();
//reusing some of julien's code
for(c = 0; c < string_length(dialogOrderString); c++){
		if(string_char_at(dialogOrderString, c) == "#"){
			ds_list_add(dialogOrder, real(string_copy(dialogOrderString, startOfText, c-startOfText))); //real() pares to real (int)
			startOfText = c+1;
		}
		else if(c == string_length(dialogOrderString) - 1){
			ds_list_add(dialogOrder, real(string_copy(dialogOrderString, startOfText, c-startOfText+2)));
		}
	}
