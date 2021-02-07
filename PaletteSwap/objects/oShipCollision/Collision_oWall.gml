/// @description Stop falling and swap view to player
global.cutscene = false;
vsp = 0;
sprite_index = sShipDamaged;

if(!playerCreated)
{
	instance_create_layer(x,y,"Player",oPlayer);
	oPlayer.vsp = -20;
	oPlayer.hsp = 20;
	oPlayer.isRolling = true;
	playerCreated = true;
}