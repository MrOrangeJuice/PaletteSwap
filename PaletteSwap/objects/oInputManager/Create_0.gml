/// @description Init input
// You can write your code in this editor
global.leftKeyHeld = 0;
global.rightKeyHeld = 0;
global.upKeyHeld = 0;
global.downKeyHeld = 0;
global.jumpKeyHeld = 0;
global.jumpKeyRelease = 0;
global.dashKeyPress = 0;
global.swapUpKeyPress = 0;
global.swapDownKeyPress = 0;
global.p1KeyPress = 0;
global.p2KeyPress = 0;
global.p3KeyPress = 0;
global.p4KeyPress = 0;
global.signKeyPress = 0;
global.continueRelease = 0;

leftKeyStore = ord("A");
rightKeyStore = ord("D");
upKeyStore = ord("W");
downKeyStore = ord("S");
jumpKeyStore = ord("P");
jumpAltKeyStore = vk_space;
dashKeyStore = ord("O");
dashAltKeyStore = vk_lshift;
swapUpKeyStore = ord("E");
swapUpAltKeyStore = ord("I");
swapDownKeyStore = ord("Q");
swapDownAltKeyStore = ord("U");
palette1KeyStore = ord("1");
palette2KeyStore = ord("2");
palette3KeyStore = ord("3");
palette4KeyStore = ord("4");
continueKeyStore = ord("x");
continueAltKeyStore = vk_enter;

global.controller = 0;