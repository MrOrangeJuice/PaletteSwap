/// @description Insert description here
// You can write your code in this editor
oPortal.visible = true;
fixed = true;
fixing = false;
alarm[0] = room_speed * 0.35;
SwapSprite(sVillagerWalk);
image_index = global.color * (sprite_get_number(sprite_index) / global.color_count);