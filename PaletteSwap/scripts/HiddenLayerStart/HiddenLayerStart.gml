// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HiddenLayerStart(){
	if(event_type == ev_draw && event_number == 0){
		shader_set(shFading);
		hlParams = shader_get_uniform(shFading, "layerAlpha");
		shader_set_uniform_f(hlParams, global.hiddenLayerAlpha);
	}
}