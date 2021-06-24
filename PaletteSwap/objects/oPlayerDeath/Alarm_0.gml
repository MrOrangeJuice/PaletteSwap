/// @description Destroy
global.hp = 100;
player = instance_create_layer(global.lastCheckpointX, global.lastCheckpointY,"Player",oPlayer);
player.villager = villager;
instance_destroy();