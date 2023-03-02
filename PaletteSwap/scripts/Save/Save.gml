// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Save(){
	instance_create_layer(-64,-64,"Instances",oAutosave);
	saveData = buffer_create(16384, buffer_grow, 1);
	buffer_write(saveData, buffer_string, global.versionNum);
	buffer_write(saveData, buffer_bool, global.tutorialCompleted);
	buffer_write(saveData, buffer_bool, global.templeCompleted);
	buffer_write(saveData, buffer_bool, global.seasideCompleted);
	buffer_write(saveData, buffer_bool, global.factoryCompleted);
	buffer_write(saveData, buffer_bool, global.allPalettesUnlocked);
	buffer_write(saveData, buffer_bool, global.templeGearArray[0]);
	buffer_write(saveData, buffer_bool, global.templeGearArray[1]);
	buffer_write(saveData, buffer_bool, global.templeGearArray[2]);
	buffer_write(saveData, buffer_bool, global.templeGearArray[3]);
	buffer_write(saveData, buffer_bool, global.seasideGearArray[0]);
	buffer_write(saveData, buffer_bool, global.seasideGearArray[1]);
	buffer_write(saveData, buffer_bool, global.seasideGearArray[2]);
	buffer_write(saveData, buffer_bool, global.seasideGearArray[3]);
	buffer_write(saveData, buffer_bool, global.factoryGearArray[0]);
	buffer_write(saveData, buffer_bool, global.factoryGearArray[1]);
	buffer_write(saveData, buffer_bool, global.factoryGearArray[2]);
	buffer_write(saveData, buffer_bool, global.factoryGearArray[3]);
	buffer_write(saveData, buffer_bool, global.factoryGearArray[4]);
	buffer_write(saveData, buffer_bool, global.speedrun1GearArray[0]);
	buffer_write(saveData, buffer_bool, global.speedrun1GearArray[1]);
	buffer_write(saveData, buffer_bool, global.speedrun2GearArray[0]);
	buffer_write(saveData, buffer_bool, global.speedrun2GearArray[1]);
	buffer_write(saveData, buffer_bool, global.speedrun3GearArray[0]);
	buffer_write(saveData, buffer_bool, global.speedrun3GearArray[1]);
	buffer_write(saveData, buffer_u64, global.vendingGearsCollected);
	buffer_write(saveData, buffer_u64, global.gearTotal);
	buffer_write(saveData, buffer_u64, global.coins);
	buffer_write(saveData, buffer_f64, global.speedrunBests[0]);
	buffer_write(saveData, buffer_f64, global.speedrunBests[1]);
	buffer_write(saveData, buffer_f64, global.speedrunBests[2]);
	buffer_write(saveData, buffer_bool, global.colorblind);
	buffer_write(saveData, buffer_bool, global.music);
	buffer_write(saveData, buffer_bool, global.fullscreen);
	buffer_seek(saveData, buffer_seek_start, 0);
	buffer_save(saveData, "saveData.sav");
	buffer_delete(saveData);
}