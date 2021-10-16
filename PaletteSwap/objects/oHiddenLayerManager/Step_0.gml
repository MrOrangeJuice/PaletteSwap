/// @description Insert description here
// You can write your code in this editor
	if(layer_exists("HiddenGreen"))
	layer_set_visible("HiddenGreen", false);
	if(layer_exists("HiddenBlue"))
	layer_set_visible("HiddenBlue", false);
	if(layer_exists("HiddenRed"))
	layer_set_visible("HiddenRed", false);
	if(layer_exists("HiddenPurple"))
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