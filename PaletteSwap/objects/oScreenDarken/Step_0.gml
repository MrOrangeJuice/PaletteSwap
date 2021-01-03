/// @description Pausing
if (keyboard_check_pressed(vk_escape)){
	global.paused = !global.paused;
	if(global.paused){
		visible = true;
		instance_deactivate_all(1);
		instance_activate_object(global.pauseMenu);
		instance_deactivate_object(global.hud);
	}
	else{
		visible = false;
		instance_activate_all();
		
		instance_activate_object(global.hud);
		instance_deactivate_object(global.pauseMenu);
	}
}