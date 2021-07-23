/// @description Insert description here
// You can write your code in this editor
currentframe = 0;
pushed = false;
dependencies = ds_list_create();

for (i = 0; i < instance_number(oLeverBlock); i++){
	currentInstance = instance_find(oLeverBlock, i);
	if (currentInstance.switchChannel == switchChannel){
		ds_list_add(dependencies, currentInstance);
	}
}