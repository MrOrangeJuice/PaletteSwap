/// @description Initialize Variables
currentframe = 0;
spikeReady = false;
isCeiling = false;
hasSpike = false;
if (abs(image_angle) == 180){
	spikeRef = instance_create_layer(x, y-8, "Spikes", oIcicleSpike);
	spikeReady = true;
	isCeiling = true;
	hasSpike = true;
}
playerRef = instance_find(oPlayer, 0);