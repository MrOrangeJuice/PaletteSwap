// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Save(){
    instance_create_layer(-64,-64,"Instances",oAutosave);
    ini_open("savedata.ini");
    ini_write_real("savegame", "tutorialCompleted", global.tutorialCompleted);
    ini_write_real("savegame", "templeCompleted", global.templeCompleted);
    ini_write_real("savegame", "seasideCompleted", global.seasideCompleted);
    ini_write_real("savegame", "factoryCompleted", global.factoryCompleted);
    ini_write_real("savegame", "allPalettes", global.allPalettesUnlocked);
    ini_write_real("savegame", "templeGear1", global.templeGearArray[0]);
    ini_write_real("savegame", "templeGear2", global.templeGearArray[1]);
    ini_write_real("savegame", "templeGear3", global.templeGearArray[2]);
    ini_write_real("savegame", "templeGear4", global.templeGearArray[3]);
    ini_write_real("savegame", "seasideGear1", global.seasideGearArray[0]);
    ini_write_real("savegame", "seasideGear2", global.seasideGearArray[1]);
    ini_write_real("savegame", "seasideGear3", global.seasideGearArray[2]);
    ini_write_real("savegame", "seasideGear4", global.seasideGearArray[3]);
    ini_write_real("savegame", "factoryGear1", global.factoryGearArray[0]);
    ini_write_real("savegame", "factoryGear2", global.factoryGearArray[1]);
    ini_write_real("savegame", "factoryGear3", global.factoryGearArray[2]);
    ini_write_real("savegame", "factoryGear4", global.factoryGearArray[3]);
    ini_write_real("savegame", "factoryGear5", global.factoryGearArray[4]);
    ini_write_real("savegame", "speedrun1Gear1", global.speedrun1GearArray[0]);
    ini_write_real("savegame", "speedrun1Gear2", global.speedrun1GearArray[1]);
    ini_write_real("savegame", "speedrun2Gear1", global.speedrun2GearArray[0]);
    ini_write_real("savegame", "speedrun2Gear2", global.speedrun2GearArray[1]);
    ini_write_real("savegame", "speedrun3Gear1", global.speedrun3GearArray[0]);
    ini_write_real("savegame", "speedrun3Gear2", global.speedrun3GearArray[1]);
    ini_write_real("savegame", "totalVending", global.vendingGearsCollected);
    ini_write_real("savegame", "totalGears", global.gearTotal);
    ini_write_real("savegame", "totalCoins", global.coins);
    ini_write_real("savegame", "srPB0", global.speedrunBests[0]);
    ini_write_real("savegame", "srPB1", global.speedrunBests[1]);
    ini_write_real("savegame", "srPB2", global.speedrunBests[2]);
	ini_write_real("savegame", "colorblind", global.colorblind);
	ini_write_real("savegame", "music", global.music);
	ini_write_real("savegame", "fullscreen", global.fullscreen);
    ini_close();
}