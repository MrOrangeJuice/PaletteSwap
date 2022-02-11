/// @description Insert description here
// You can write your code in this editor

event_inherited();

if(levelComplete == "seaside")
{
	if(!global.seasideCompleted)	
	{
		instance_destroy();	
	}
}
if(levelComplete == "factory")
{
	if(!global.factoryCompleted)	
	{
		instance_destroy();	
	}
}

face = sVillager;
eName = "Don Mayor Gerald";