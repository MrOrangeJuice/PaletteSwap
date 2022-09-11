/// @description initiate cutscene
// You can write your code in this editor
if (global.color == 0){
	instance_create_layer(other.x,other.y-90,"FX",oEdd0);
}
else {
	started = false; //go back to start
	indexer = -1;
}