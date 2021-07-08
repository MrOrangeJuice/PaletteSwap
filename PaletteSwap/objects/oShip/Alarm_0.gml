/// @description Spawn Player

instance_create_layer(x,y,"Player",oPlayer);
oPlayer.vsp = -20;
playerCreated = true;
global.cutscene = false;