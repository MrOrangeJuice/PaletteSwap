/// @description Init
currentframe = 0;
image_index = global.color;
vsp = -0.5;
vdir = 0.5;
image_index = global.color * (sprite_get_number(sprite_index) / global.color_count);