// Script assets have changed for v2.3.0 see
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(){
    ini_open("savedata.ini");
    global.tutorialCompleted = ini_read_real("savegame", "tutorialCompleted", 0);
    global.templeCompleted = ini_read_real("savegame", "templeCompleted", 0);
    global.seasideCompleted = ini_read_real("savegame", "seasideCompleted", 0);
    global.factoryCompleted = ini_read_real("savegame", "factoryCompleted", 0);
    global.allPalettesUnlocked = ini_read_real("savegame", "allPalettes", 0);
    global.templeGearArray[0] = ini_read_real("savegame", "templeGear1", 0);
    global.templeGearArray[1] = ini_read_real("savegame", "templeGear2", 0);
    global.templeGearArray[2] = ini_read_real("savegame", "templeGear3", 0);
    global.templeGearArray[3] = ini_read_real("savegame", "templeGear4", 0);
    global.seasideGearArray[0] = ini_read_real("savegame", "seasideGear1", 0);
    global.seasideGearArray[1] = ini_read_real("savegame", "seasideGear2", 0);
    global.seasideGearArray[2] = ini_read_real("savegame", "seasideGear3", 0);
    global.seasideGearArray[3] = ini_read_real("savegame", "seasideGear4", 0);
    global.factoryGearArray[0] = ini_read_real("savegame", "factoryGear1", 0);
    global.factoryGearArray[1] = ini_read_real("savegame", "factoryGear2", 0);
    global.factoryGearArray[2] = ini_read_real("savegame", "factoryGear3", 0);
    global.factoryGearArray[3] = ini_read_real("savegame", "factoryGear4", 0);
    global.factoryGearArray[4] = ini_read_real("savegame", "factoryGear5", 0);
    global.speedrun1GearArray[0] = ini_read_real("savegame", "speedrun1Gear1", 0);
    global.speedrun1GearArray[1] = ini_read_real("savegame", "speedrun1Gear2", 0);
    global.speedrun2GearArray[0] = ini_read_real("savegame", "speedrun2Gear1", 0);
    global.speedrun2GearArray[1] = ini_read_real("savegame", "speedrun2Gear2", 0);
    global.speedrun3GearArray[0] = ini_read_real("savegame", "speedrun3Gear1", 0);
    global.speedrun3GearArray[1] = ini_read_real("savegame", "speedrun3Gear2", 0);
    global.vendingGearsCollected = ini_read_real("savegame", "totalVending", 0);
    global.gearTotal = ini_read_real("savegame", "totalGears", 0);
    global.coins = ini_read_real("savegame", "totalCoins", 0);
    global.speedrunBests[0] = ini_read_real("savegame", "srPB0", -1);
    global.speedrunBests[1] = ini_read_real("savegame", "srPB1", -1);
    global.speedrunBests[2] = ini_read_real("savegame", "srPB2", -1);
	global.colorblind = ini_read_real("savegame", "colorblind", false);
	global.music = ini_read_real("savegame", "music", false);
	global.fullscreen = ini_read_real("savegame", "fullscreen", false);
    ini_close();
}