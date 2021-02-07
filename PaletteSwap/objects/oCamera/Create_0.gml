/// @description Setup camera
// You can write your code in this editor

// Stop menu music
audio_stop_sound(msc_Title);
cam = view_camera[0];
follow = oPlayer;
jelliness = 6;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;