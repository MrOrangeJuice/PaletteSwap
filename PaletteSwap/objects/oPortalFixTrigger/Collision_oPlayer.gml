/// @description Insert description here
// You can write your code in this editor
if (other.villager){
	spikeRef = instance_create_layer(other.x, other.y, "FX", oFixingVillager);
	other.villager = false;
}