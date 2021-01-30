/// @description Collect Coin
audio_stop_sound(snd_Coin);
audio_play_sound(snd_Coin, 4, false);
ds_list_delete(global.coinArrX, other.coinId);
ds_list_delete(global.coinArrY, other.coinId);
instance_destroy(other);
global.coins++;
global.coinId--;
with (oGame) coinTextScale = 1.2;