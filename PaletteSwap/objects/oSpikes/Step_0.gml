/// @description Swap Palette
//update frame
if (spikeReady && global.color = 1){
	if (place_meeting(x, playerRef.y, playerRef) && playerRef.y >= y && playerRef.y - y < 160){
		spikeReady = false;
		spikeRef.falling = true;
		alarm[0] = room_speed * 0.5;
		hasSpike = false;
	}
} else if(!spikeReady && isCeiling & hasSpike) {
	spikeRef.image_xscale += 0.01;
	spikeRef.image_yscale += 0.01;
	if (spikeRef.image_xscale >= 1) {spikeReady = true};
}
PaletteAnimationSwap();