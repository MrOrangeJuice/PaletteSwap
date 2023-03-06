/// @description Init

image_speed = 0;
alarm[0] = room_speed * (random_range(1,2));
hsp = 0;
randomize();
dir = sign(random_range(-2,2));
if(dir == 0) dir = 1;
