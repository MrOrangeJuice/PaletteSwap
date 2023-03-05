/// @description Init

image_speed = 0;
alarm[0] = room_speed * 1.5;
hsp = 0;
randomize();
dir = sign(random_range(-2,2));
if(dir == 0) dir = 1;
