/// @description Insert description here
// You can write your code in this editor

instance_destroy(text);
if (count > 0){
	text = instance_create_layer(x,y,"FX",oScreenText);
	text.textMessage = count;
	alarm[0] = room_speed * 0.6;
} else if (count == 0) {
	text = instance_create_layer(x,y,"FX",oScreenText);
	text.textMessage = "GO!";
	global.textUp = false;
	alarm[0] = room_speed;
}
count--;