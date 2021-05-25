/// @description Insert description here
// You can write your code in this editor
audio_stop_sound(snd_Collectible);
audio_play_sound(snd_Collectible, 4, false);
instance_destroy(other);
global.collectibles++;
with (oGame) collectableTextScale = 1.2;