/// @description Insert description here
// You can write your code in this editor
if (mapUp){
	draw_sprite_stretched(mapSprite, global.color, RES_W / 4, RES_H /4, RES_W / 2, RES_H /2);
	draw_sprite(sFernGlasses, global.color, RES_W / 4 + (RES_W / 2) * (oPlayer.x / roomWidth), RES_H / 4 + (RES_H / 2) * (oPlayer.y / roomHeight));
}