/// @description Play Seaside Music
audio_stop_sound(msc_FactoryIntro);
audio_stop_sound(msc_FactoryLoop);
audio_stop_sound(msc_Hub);
if(global.music) audio_play_sound(msc_FactoryIntro, 5, false);
alarm[0] = room_speed * 14.33;