/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor


if(instance_exists(oPlayer))
{
	playerRef = instance_find(oPlayer, 0);

	with (playerRef){ //THIS BLOCK EXECUTES AS THE PLAYER
		if (!isDashing){
			if (place_meeting(x+hsp,y,other))
			{
				DoCollision(other, false);
				currentwalksp = 0;
			}
			if (place_meeting(x,y+vsp,other))
			{
				DoCollision(other, true);
			}
		} else {
			if (place_meeting(x,y+vsp,other))
			{
			wallY = 0;
			while (!place_meeting(x,y+wallY,other))
			{
				wallY = wallY + sign(vsp);
			}
			FX = instance_create_layer(x, y+wallY,"Coins",oDashFX);
			if (dashup) {
				FX.image_angle = 180;
			}
			//collide with wall    |  -11 down, 5 up  |
			DoDashCollision(other, (sign(vsp) * -8) - 3, 0, true);
			}
			
			if (place_meeting(x+hsp,y,other))
			{
			// Determine where wall is
			wallX = 0;
			while (!place_meeting(x+wallX,y,other))
			{
				wallX = wallX + sign(hsp);
			}
			FX = instance_create_layer(x+wallX-hsp, y,"Coins",oDashFX);
			FX.image_angle = sign(hsp) * 90;
			DoDashCollision(other, -7, sign(hsp) * -6, false);
			}
		}
	}//SPICY BLOCK
}
