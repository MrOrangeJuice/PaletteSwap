// Changes the player's dash length and velocity
// blueDashSp - extra velocity the player gets in the blue palette
// dashEnd - the end timer for the player's dash. 0 actually translates to 0.3 seconds, and going negative
//			extends the dash, while going positive shortens the dash.
function AdjustDashParams(){
	// First, check if the player exists.
	if (instance_exists(oPlayer)) {
		// If the player enters the blue palette, increase their dash velocity.
		// Also increase how long the dash lasts with the dashEnd variable.
		// Otherwise, they have normal dash velocity/distance.
		if (global.color == 1) {
			oPlayer.blueDashSp = 4;
			oPlayer.dashEnd = -0.1;
		}
		else {
			oPlayer.blueDashSp = 0;
			oPlayer.dashEnd = 0;
		}
	}
}