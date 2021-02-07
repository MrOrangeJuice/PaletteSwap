/// @description Insert description here
// You can write your code in this editor
global.lastCheckpointX = x;
global.lastCheckpointY = y;
if(global.loaded){
	x = global.loadX;
	y = global.loadY;
	global.coins = global.loadCoins;
	global.hp = global.loadHp;
	global.time = global.loadTime;
	global.coinsDestroyed = true;
	for(c = 0; c < ds_list_size(global.loadCoinsX); c++){
		instance_create_layer(ds_list_find_value(global.loadCoinsX, c), ds_list_find_value(global.loadCoinsY, c), "Coins", oCoin);
	}
}