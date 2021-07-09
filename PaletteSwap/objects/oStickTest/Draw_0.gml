/// @description Draw Level Select
DrawSetText($002704, fUI, 0, 0);
draw_set_halign(fa_center);
draw_text(160, 10, "Stick Test");
draw_text(160, 50, "LeftH: " + string(gamepad_axis_value(0,gp_axislh)));
draw_text(160, 100, "LeftV: " + string(gamepad_axis_value(0,gp_axislv)));