/// @description Pausing

if (global.cutscene == true) {
	exit;	
}

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
		global.menuX = RES_W/2;
		global.menuY = RES_H/2;
		//instance_deactivate_all(1);
		instance_activate_object(oPauseButtons);
	}
	else{
		if(!instance_exists(oShip))
		{
			oPlayer.canJump = false;	
		}
		audio_play_sound(snd_Pause2_out,5,false);
		visible = false;
		//instance_activate_all();
		instance_deactivate_object(oPauseButtons);
	}
}