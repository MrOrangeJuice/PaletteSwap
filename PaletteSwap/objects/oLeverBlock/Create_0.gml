/// @description Insert description here
// You can write your code in this editor
currentframe = 0;

switch(blockLength)
{
	case 0:
		sprite_index = sLeverBlock;
		break;
	case 1:
		sprite_index = sLeverBlockLong;
		break;
	case 2:
		sprite_index = sLeverBlockVertical;
		break;
	case 3:
		sprite_index = sLeverBlockShort;
		break;
}