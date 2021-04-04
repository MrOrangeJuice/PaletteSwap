/// @description Go Back To Menu
global.color = 0;
if(room == PaletteTempleLevel)
{
	audio_stop_sound(msc_Level);
}
SlideTransition(TRANS_MODE.GOTO, next_room);