/// @description Init
currentframe = 0;
hsp = 0;
vsp = 0;
grv = 0.4;
door = instance_find(oDoor, 0);
image_index = global.color * (sprite_get_number(sprite_index) / global.color_count);