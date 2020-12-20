/// @description Collect Coin
audio_stop_sound(snd_Coin);
audio_play_sound(snd_Coin, 4, false);
instance_destroy(other);
global.coins++;
with (oGame) coinTextScale = 1.2;