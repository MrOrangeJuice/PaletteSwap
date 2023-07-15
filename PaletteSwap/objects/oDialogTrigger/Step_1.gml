/// @description Insert description here
// You can write your code in this editor
if(!global.paused && triggered && !global.canControlTimer && started){
key_space = global.continueRelease;

//update dependent text object
if (instance_exists(text)) text.key_space = key_space;

}