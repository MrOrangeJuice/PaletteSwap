/// @description Insert description here
// You can write your code in this editor
global.color = 0;
global.isSpeedrun = false;
//create persistent results ferrying object
res = instance_create_layer(0, 0, "Player", oSRResults);
res.time1 = time1;
res.time2 = time2;
res.srLevelID = srLevelID;
res.finishedTime = global.time;

audio_play_sound(snd_Collectible,5,false);
audio_stop_sound(msc_Level);
audio_stop_sound(msc_Seaside);
audio_stop_sound(msc_FactoryLoop);
audio_stop_sound(msc_FactoryIntro);

SlideTransition(TRANS_MODE.GOTO, rSRResults);

//stop extra collisions lol
instance_destroy(self);