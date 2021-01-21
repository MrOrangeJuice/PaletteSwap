/// @description Pausing
key_esc = keyboard_check_pressed(vk_escape);
if (gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(4,gp_start))
{
	key_esc = 1;
}
if (key_esc = 1){
	global.paused = !global.paused;
	if(global.paused){
		audio_play_sound(snd_Pause2,5,false);
		visible = true;
		global.menuX = oCamera.x;
		global.menuY = oCamera.y;
		//instance_deactivate_all(1);
		instance_activate_object(oPauseButtons);
	}
	else{
		audio_play_sound(snd_Pause2_out,5,false);
		visible = false;
		//instance_activate_all();
		instance_deactivate_object(oPauseButtons);
	}
}