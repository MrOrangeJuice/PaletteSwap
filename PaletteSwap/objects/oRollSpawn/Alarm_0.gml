/// @description Spawn Roll

newRoll = instance_create_layer(x,y + 32, "EnemiesAndOtherCharacters",oRoll);
if(global.color == 0) newRoll.xdir = 1;
if(global.color == 1) newRoll.xdir = -1;
alarm[0] = room_speed * 3;