/// @description Draw Level Select
DrawSetText($002704, fUI, 0, 0);
draw_set_halign(fa_center);
draw_text(160, 10, "Stick Test");
draw_text(80, 20, "XInput:");
draw_text(80, 50, "LeftH: " + string(gamepad_axis_value(0,gp_axislh)));
draw_text(80, 100, "LeftV: " + string(gamepad_axis_value(0,gp_axislv)));
draw_text(240, 20, "DInput:");
draw_text(240, 50, "LeftH: " + string(gamepad_axis_value(4,gp_axislh)));
draw_text(240, 100, "LeftV: " + string(gamepad_axis_value(4,gp_axislv)));