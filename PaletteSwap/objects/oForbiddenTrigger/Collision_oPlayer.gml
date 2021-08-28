/// @description Insert description here
// You can write your code in this editor
if (indexer < 8) {
//sequence advance
if (global.color == sequence[indexer + 1]) indexer++;
//sequence break check
if (indexer != -1 && global.color != sequence[indexer]) indexer = -1;
}
else if (!started){
	//start cutscene
	instance_create_layer(other.x,other.y-180,"FX",oEdd0);
	started = true;
}
