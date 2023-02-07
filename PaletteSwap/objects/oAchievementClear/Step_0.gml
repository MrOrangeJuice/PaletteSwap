/// @description Delete Achievements

if(keyboard_check_pressed(vk_f3))
{
	audio_play_sound(snd_Death,5,false);
	steam_clear_achievement("tutorial");
	steam_clear_achievement("temple");
	steam_clear_achievement("seaside");
	steam_clear_achievement("factory");
	steam_clear_achievement("templespeed");
	steam_clear_achievement("seasidespeed");
	steam_clear_achievement("factoryspeed");
	steam_clear_achievement("horror");
	steam_clear_achievement("100");
}