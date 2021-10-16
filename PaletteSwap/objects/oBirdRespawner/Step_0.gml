/// @description Insert description here
// You can write your code in this editor
if (visible){
	if (instance_exists(oPlayer)){
		image_xscale = sign(oPlayer.x - x);
	}
	PaletteAnimationSwapSingle();
}