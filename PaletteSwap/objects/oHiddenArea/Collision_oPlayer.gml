/// @description Insert description here
// You can write your code in this editor
switch(global.color)
	{
		case 1:
			layer_set_visible("HiddenBlue", false);
			break;
		case 2:
			layer_set_visible("HiddenRed", false);
			break;
		case 3:
			layer_set_visible("HiddenPurple", false);
			break;
		default:
			layer_set_visible("HiddenGreen", false);
			break;
	}