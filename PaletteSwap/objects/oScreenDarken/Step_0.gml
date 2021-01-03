/// @description Pausing
if (keyboard_check_pressed(vk_escape)){
	global.paused = !global.paused;
	if(global.paused){
		visible = true;
		instance_deactivate_all(1);
	}
	else{
		visible = false;
		instance_activate_all();
	}
}