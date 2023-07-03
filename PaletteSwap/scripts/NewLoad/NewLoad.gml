// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewLoad(){
	if (file_exists("savedata.ini")) {
		return ConvertIniSave();
	}
	if (file_exists("saveData.sav") == false){
		return false;
	}
	saveData = buffer_load("saveData.sav");
	buffer_seek(saveData, buffer_seek_start, 0);
	saveVersionNum = buffer_read(saveData, buffer_string);
	if (saveVersionNum != global.versionNum) {
		
	}
	global.tutorialCompleted = buffer_read(saveData, buffer_bool);
	global.templeCompleted = buffer_read(saveData, buffer_bool);
	global.seasideCompleted = buffer_read(saveData, buffer_bool);
	global.factoryCompleted = buffer_read(saveData, buffer_bool);
	global.allPalettesUnlocked = buffer_read(saveData, buffer_bool);
	global.templeGearArray[0] = buffer_read(saveData, buffer_bool);
	global.templeGearArray[1] = buffer_read(saveData, buffer_bool);
	global.templeGearArray[2] = buffer_read(saveData, buffer_bool);
	global.templeGearArray[3] = buffer_read(saveData, buffer_bool);
	global.seasideGearArray[0] = buffer_read(saveData, buffer_bool);
	global.seasideGearArray[1] = buffer_read(saveData, buffer_bool);
	global.seasideGearArray[2] = buffer_read(saveData, buffer_bool);
	global.seasideGearArray[3] = buffer_read(saveData, buffer_bool);
	global.factoryGearArray[0] = buffer_read(saveData, buffer_bool);
	global.factoryGearArray[1] = buffer_read(saveData, buffer_bool);
	global.factoryGearArray[2] = buffer_read(saveData, buffer_bool);
	global.factoryGearArray[3] = buffer_read(saveData, buffer_bool);
	global.factoryGearArray[4] = buffer_read(saveData, buffer_bool);
	global.speedrun1GearArray[0] = buffer_read(saveData, buffer_bool);
	global.speedrun1GearArray[1] = buffer_read(saveData, buffer_bool);
	global.speedrun2GearArray[0] = buffer_read(saveData, buffer_bool);
	global.speedrun2GearArray[1] = buffer_read(saveData, buffer_bool);
	global.speedrun3GearArray[0] = buffer_read(saveData, buffer_bool);
	global.speedrun3GearArray[1] = buffer_read(saveData, buffer_bool);
	global.vendingGearsCollected = buffer_read(saveData, buffer_u64);
	global.gearTotal = buffer_read(saveData, buffer_u64);
	global.coins = buffer_read(saveData, buffer_u64);
	global.speedrunBests[0] = buffer_read(saveData, buffer_f64);
	global.speedrunBests[1] = buffer_read(saveData, buffer_f64);
	global.speedrunBests[2] = buffer_read(saveData, buffer_f64);
	global.colorblind = buffer_read(saveData, buffer_bool);
	global.music = buffer_read(saveData, buffer_bool);
	global.fullscreen = buffer_read(saveData, buffer_bool);
	buffer_delete(saveData);
	return true;
}