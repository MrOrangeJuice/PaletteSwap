/// @description Collect Coin
audio_stop_sound(snd_Coin);
audio_play_sound(snd_Coin, 4, false);
for(c = 0; c < ds_list_size(global.coinArrX); c++){
	if(ds_list_find_value(global.coinArrX, c) == other.x && ds_list_find_value(global.coinArrY, c) == other.y){
		ds_list_delete(global.coinArrX, c);
		ds_list_delete(global.coinArrY, c);
	}
}
global.coinId--;
instance_destroy(other);
instance_create_layer(other.x,other.y,"Coins",oCoinFX);
global.coins++;
with (oGame) coinTextScale = 1.2;