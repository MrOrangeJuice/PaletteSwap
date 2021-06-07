/// @description Spawn Roll

newRoll = instance_create_layer(x,y + 32, "EnemiesAndOtherCharacters",oRoll);
if(global.color == 0) 
{
	newRoll.hsp = 2;
	newRoll.rollsp = -3;
}
if(global.color == 1)
{
	newRoll.hsp = -2;
	newRoll.rollsp = 3;
}
alarm[0] = room_speed * 6;