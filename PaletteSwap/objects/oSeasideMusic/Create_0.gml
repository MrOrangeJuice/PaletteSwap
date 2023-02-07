/// @description Play Seaside Music
audio_stop_sound(msc_Seaside);
audio_stop_sound(msc_Hub);
if(global.music) audio_play_sound(msc_Seaside, 5, true);