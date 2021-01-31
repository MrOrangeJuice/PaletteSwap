/// @description Collect Coin
audio_stop_sound(snd_Coin);
audio_play_sound(snd_Coin, 4, false);
for(c = 0; c < ds_list_size(global.coinArrX); c++){
	if(ds_list_find_value(global.coinArrX, c) == other.x && ds_list_find_value(global.coinArrY, c) == other.y){
		ds_list_delete(global.coinArrX, c);
		ds_list_delete(global.coinArrY, c);
		break;
	}
}
instance_destroy(other);
global.coins++;
global.coinId--;
with (oGame) coinTextScale = 1.2;