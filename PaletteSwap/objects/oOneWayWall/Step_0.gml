/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer))
{
	playerRef = instance_find(oPlayer, 0);

	with (playerRef){ //THIS BLOCK EXECUTES AS THE PLAYER
	if (place_meeting(x + hsp,y,other) && !other.dirVert && sign(hsp) != other.dir)
		{
			DoCollision(other, false);
			currentwalksp = 0;
		}
	if (place_meeting(x,y + vsp,other) && other.dirVert && sign(vsp) == other.dir)
		{
			DoCollision(other, true);
		}
	}//SPICY BLOCK
}