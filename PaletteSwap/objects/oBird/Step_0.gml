/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (eHP <= 0){
	instance_create_layer(x, y, "Enemies", oBirdRespawner);
}
event_inherited();

