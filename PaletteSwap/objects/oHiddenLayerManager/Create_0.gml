/// @description Insert description here
// You can write your code in this editor
global.hiddenLayerAlpha = 1;
layer_script_begin("HiddenGreen", HiddenLayerStart);
layer_script_end("HiddenGreen", HiddenLayerEnd);
if (layer_exists("HiddenBlue")){
	layer_script_begin("HiddenBlue", HiddenLayerStart);
	layer_script_end("HiddenBlue", HiddenLayerEnd);
}
if (layer_exists("HiddenRed")){
	layer_script_begin("HiddenRed", HiddenLayerStart);
	layer_script_end("HiddenRed", HiddenLayerEnd);
}
if (layer_exists("HiddenPurple")){
	layer_script_begin("HiddenPurple", HiddenLayerStart);
	layer_script_end("HiddenPurple", HiddenLayerEnd);
}