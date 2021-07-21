/// @description Launch Crate
crate = instance_create_layer(x+24,y-24,"Enemies",oPhysicsCrate);
crate.hsp = 10;
crate.vsp = -10;
if(point_distance(x,y,oPlayer.x,oPlayer.y) < 300) audio_play_sound(snd_Cannon,5,false);
alarm[1] = room_speed * 0.5;