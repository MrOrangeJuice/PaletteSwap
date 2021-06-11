/// @description Insert description here
// You can write your code in this editor
oPortal.visible = true;
fixed = true;
fixing = false;
audio_play_sound(snd_Portal,5,false);
alarm[0] = room_speed * 0.35;
SwapSprite(sVillagerWalk);
//for some reason, this happens late and you need to set the frame manually :)
image_index = global.color * (sprite_get_number(sprite_index) / global.color_count);