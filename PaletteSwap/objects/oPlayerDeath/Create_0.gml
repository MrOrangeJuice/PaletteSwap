/// @description Init
audio_play_sound(snd_Death, 5, false);
currentframe = 0;
image_index = global.color * (sprite_get_number(sprite_index) / global.color_count);
alarm[0] = room_speed;