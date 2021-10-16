/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_roundrect(posX,posY,posX+width,posY+height,0);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(posX+width/2,posY+height/2,tempKey);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);