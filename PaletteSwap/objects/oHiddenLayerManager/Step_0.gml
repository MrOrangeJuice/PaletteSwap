/// @description Insert description here
// You can write your code in this editor
	layer_set_visible("HiddenGreen", false);
	layer_set_visible("HiddenBlue", false);
	layer_set_visible("HiddenRed", false);
	layer_set_visible("HiddenPurple", false);
	switch(global.color)
	{
		case 1:
			layer_set_visible("HiddenBlue", true);
			break;
		case 2:
			layer_set_visible("HiddenRed", true);
			break;
		case 3:
			layer_set_visible("HiddenPurple", true);
			break;
		default:
			layer_set_visible("HiddenGreen", true);
			break;
	}
	
	if (global.hiddenLayerAlpha < 1){
		global.hiddenLayerAlpha += 0.06;
	}