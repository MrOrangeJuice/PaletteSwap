/// @description Initialize Variables
currentframe = 0;
if(global.loaded){
	instance_destroy();
}
else{
	ds_list_add(global.coinArrX, x);
	ds_list_add(global.coinArrY, y);
	global.coinId++;
}