/// @description Size variables and mode setup

w = 320;
h = 180;
h_half = h * 0.5;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANS_MODE.INTRO; 
percent = 1;
target = room;