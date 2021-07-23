/// @description Init
currentframe = 0;

dependencies = ds_list_create();

for (i = 0; i < instance_number(oLeverBlock); i++){
	currentInstance = instance_find(oLeverBlock, i);
	if (currentInstance.switchChannel == switchChannel){
		ds_list_add(dependencies, currentInstance);
	}
}