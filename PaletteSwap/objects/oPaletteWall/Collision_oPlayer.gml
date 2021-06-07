/// @description Insert description here
// You can write your code in this editor

// Check what palette the game is in.
switch (global.color) {
	// Green palette, do normal colission.
	case 0:
		event_inherited();
		break;
	// Blue palette, swim through at half speed.
	case 1:
		// Check if Fern is vertical or horizontal.
		if (other.dashdown) {
			other.hsp /= 1.5;
		}
		else if (other.dashleft || other.dashright) {
			other.hsp /= 2;
		}
		other.swimming = true;
		break;
}