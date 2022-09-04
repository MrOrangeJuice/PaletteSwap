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
	alarm[0] = room_speed * 0.4;
	started = true;
}
