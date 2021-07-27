// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HiddenLayerEnd(){
	if(event_type == ev_draw && event_number == 0){
		shader_reset();
	}
}