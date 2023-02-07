/// @description Init
audio_stop_sound(msc_Level);
audio_stop_sound(msc_Seaside);
audio_stop_sound(msc_FactoryIntro);
audio_stop_sound(msc_FactoryLoop);
audio_stop_sound(msc_Hub);
if(global.music) audio_play_sound(msc_Hub, 5, true);