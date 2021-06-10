// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(){
	ini_open("savedata.ini");
	global.tutorialCompleted = ini_read_real("savegame", "tutorialCompleted", 0);
	global.templeGearArray[0] = ini_read_real("savegame", "templeGear1", 0);
	global.templeGearArray[1] = ini_read_real("savegame", "templeGear2", 0);
	global.templeGearArray[2] = ini_read_real("savegame", "templeGear3", 0);
	global.templeGearArray[3] = ini_read_real("savegame", "templeGear4", 0);
	global.templeGearArray[4] = ini_read_real("savegame", "templeGear5", 0);
	global.seasideGearArray[0] = ini_read_real("savegame", "seasideGear1", 0);
	global.seasideGearArray[1] = ini_read_real("savegame", "seasideGear2", 0);
	global.seasideGearArray[2] = ini_read_real("savegame", "seasideGear3", 0);
	global.seasideGearArray[3] = ini_read_real("savegame", "seasideGear4", 0);
	global.gearTotal = ini_read_real("savegame", "totalGears", 0);
	ini_close();
}