/// @description Insert description here
// You can write your code in this editor

// Stop if it hits the conveyer belt, and reset the alarm
if(crashingDown && place_meeting(x,y+1,oConveyer))
{
	crashingDown = false;
	goingUp = true;
	alarm[0] = timing * room_speed;
}

/*
if(crashingDown && place_meeting(x,y+1,oPlayer))
{
	if (!oPlayer.isInvulnerable) 
	{
		audio_play_sound(snd_Damage, 5, false);
		global.hp -= 100;
		other.isInvulnerable = true;
	}
}
*/

// If at resting position, set going up to false
if(y = originaly)
{
	goingUp = false;	
}

if(crashingDown)
{
	y += 4;	
}
else if(goingUp)
{
	y -= 1;	
}


PaletteAnimationSwap();