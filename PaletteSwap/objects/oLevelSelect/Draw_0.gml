/// @description Draw Level Select
DrawSetText($002704, fUI, 0, 0);
draw_set_halign(fa_center);
levelString =  level[menuIndex];
draw_text(160, 10, "Level Select");
draw_text(160, 100, levelString);