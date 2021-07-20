/// @description Launch Crate
crate = instance_create_layer(x,y,"Enemies",oPhysicsCrate);
crate.hsp = 10;
crate.vsp = -8;
alarm[1] = room_speed * 0.5;