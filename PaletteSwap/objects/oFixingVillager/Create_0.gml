/// @description Init
currentframe = 0;
hsp = 0;
vsp = 0;
grv = 0.4;
fixed = false;
door = instance_find(oDoor, 0);
fixing = false;
image_index = global.color * (sprite_get_number(sprite_index) / global.color_count);