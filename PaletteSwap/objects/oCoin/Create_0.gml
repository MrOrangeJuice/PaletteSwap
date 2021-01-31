/// @description Initialize Variables
currentframe = 0;
coinId = -1;
if(global.loaded && !global.coinsDestroyed){
	instance_destroy();
}
else{
	ds_list_add(global.coinArrX, x);
	ds_list_add(global.coinArrY, y);
	coinId = global.coinId;
	global.coinId++;
}