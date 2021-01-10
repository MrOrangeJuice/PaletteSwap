/// @description Pausing
if (keyboard_check_pressed(vk_escape)){
	global.paused = !global.paused;
	if(global.paused){
		visible = true;
		global.menuX = oPlayer.x;
		global.menuY = oPlayer.y;
		instance_deactivate_all(1);
		instance_activate_object(oPauseButtons);
	}
	else{
		visible = false;
		instance_activate_all();
		instance_deactivate_object(oPauseButtons);
	}
}