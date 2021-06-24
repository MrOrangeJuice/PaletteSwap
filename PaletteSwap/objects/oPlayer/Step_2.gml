if(!global.paused && !global.textUp && global.canControlTimer < 0){
	//Spike collision
collidingSpikes = instance_place(x, y, oSpikes);
if(collidingSpikes != noone){
	if(!spikeImmune){
		spikeImmune = true;
			if (isInvulnerable == false) {
				global.hp -= 15;
				isInvulnerable = true;
				InitiateKnockback(oPlayer, image_xscale * -6, -7);
				global.knockedBack = true;
				isRolling = false;
				audio_play_sound(snd_Damage, 5, false);
		}
	}
}
else{
	spikeImmune = false;
}

	bottomWall = place_meeting(x, y+1, oWall);
	bottomPalette = place_meeting(x, y+1, oPaletteWall);
if (!bottomWall && !bottomPalette)
{
	airborne = true;
}
else if ((swimming && vsp >= 0) || !swimming){
	airborne = false;
	// Reset jump buffer
	jumpBuffer = 5;
	if (!isDashing)	{
		jumped = false;
	}
	// Reset roll
	if (canDash){
		isRolling = false;
	}
}
if(!isDashing){
	// Restore ability to variably jump once the bounce hits its apex
	if (vsp > 0)
	{
		jumpVar = true;	
	}
	// Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		DoCollision(oWall, false);
		currentwalksp = 0;
	}
	//collision with palette walls
	if (place_meeting(x+hsp,y,oPaletteWall))
	{
		switch (global.color){
			case 0:
				DoCollision(oPaletteWall, false);
				currentwalksp = 0;
			break;
			case 1:
				hsp /= 2;
			break;
			case 2:
				DoCollision(oPaletteWall, false);
				currentwalksp = 0;
				break;
			case 3:
				DoCollision(oPaletteWall, false);
				currentwalksp = 0;
				break;
		}
	}
		//reset red palette speed if not holding down a button
		if (!(key_left && hsp < 0) && !(key_right && hsp > 0)){
			walksp = 4.5;
		}
		//speed decay
		else if (walksp > 4.5 && global.color == 2){
			walksp -= 0.02;
		}
		else if (walksp > 4.5){
			walksp -= 0.1
		}
		else if (walksp < 4.5){
			walksp = 4.5;
		}
	
	x = x + hsp;

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		DoCollision(oWall, true);
	}
	// palette wall Collision
	if (place_meeting(x,y+vsp,oPaletteWall))
	{
		switch (global.color){
			case 0:
			//collide and not swimming
				DoCollision(oPaletteWall, true);
				swimming = false;
			break;
			case 1:
			//drastic slowdown if hitting water fast
				if (vsp >= 3){
					vsp /= 2;
				}
				if (vsp > 0) {
					//fall slower in water than you swim up
					vsp /= 1.3;
				} else vsp /= 1.1;
				
				if (place_meeting(x,y+vsp,oPaletteWall)) //dum dum fix
				{
					swimming = true;
				}
			break;
			case 2:
			//collide and not swimming
				DoCollision(oPaletteWall, true);
				swimming = false;
				if (vsp >= 0) walksp = 9;
			break;
			case 3:
			//collide and not swimming
				DoCollision(oPaletteWall, true);
				swimming = false;
			break;
		}
	}
	else{
		swimming = false;
	}
	y = y + vsp;
}
else{
	if(dashdown){
		// Handle Vertical Collision Normally
		if (place_meeting(x,y+vsp,oWall))
		{
			wallY = 0;
			while (!place_meeting(x,y+wallY,oWall))
			{
				wallY = wallY + sign(vsp);
			}
			instance_create_layer(x, y+wallY,"Coins",oDashFX);
			//collide with wall
			DoDashCollision(oWall, -11, 0, true);
		}
		if (place_meeting(x,y+vsp,oPaletteWall))
		{
			wallY = 0;
			while (!place_meeting(x,y+wallY,oPaletteWall))
			{
				wallY = wallY + sign(vsp);
			}
			switch (global.color)
			{
			case 0:
			//if green collide with wall
				instance_create_layer(x, y+wallY,"Coins",oDashFX);
				DoDashCollision(oPaletteWall, -11, 0, true);
				swimming = false;
			break;
			case 1:
			//if blue enter water
				vsp /= 1.5;
				swimming = true;
			break;
			case 2:
			//todo red
				instance_create_layer(x, y+wallY,"Coins",oDashFX);
				DoDashCollision(oPaletteWall, -11, 0, true);
				swimming = false;
			break;
			case 3:
			//todo red
				instance_create_layer(x, y+wallY,"Coins",oDashFX);
				DoDashCollision(oPaletteWall, -11, 0, true);
				swimming = false;
			break;
			}
		}
		y = y + vsp;
	}
	else {
		// Horizontal Collision
		if (place_meeting(x+hsp,y,oWall))
		{
			// Determine where wall is
			wallX = 0;
			while (!place_meeting(x+wallX,y,oWall))
			{
				wallX = wallX + sign(hsp);
			}
			FX = instance_create_layer(x+wallX-hsp, y,"Coins",oDashFX);
			FX.image_angle = sign(hsp) * 90;
			DoDashCollision(oWall, -7, sign(hsp) * -6, false);
		}
		//palette block
		if (place_meeting(x+hsp,y,oPaletteWall))
		{
			wallX = 0;
			while (!place_meeting(x+wallX,y,oPaletteWall))
			{
				wallX = wallX + sign(hsp);
			}
			switch (global.color){
			case 0:
				FX = instance_create_layer(x+wallX-hsp, y,"Coins",oDashFX);
				FX.image_angle = sign(hsp) * 90;
				DoDashCollision(oPaletteWall, -7, sign(hsp) * -6, false);
				swimming = false;
			break;
			case 1:
				hsp /= 1.5;
				swimming = true;
			break;
			case 2:
				FX = instance_create_layer(x+wallX-hsp, y,"Coins",oDashFX);
				FX.image_angle = sign(hsp) * 90;
				DoDashCollision(oPaletteWall, -7, sign(hsp) * -6, false);
				swimming = false;
			break;
			case 3:
				FX = instance_create_layer(x+wallX-hsp, y,"Coins",oDashFX);
				FX.image_angle = sign(hsp) * 90;
				DoDashCollision(oPaletteWall, -7, sign(hsp) * -6, false);
				swimming = false;
			break;
			}
		}
		else swimming = false;
		// Vertical Collision
		if (place_meeting(x,y+vsp,oWall))
		{
			DoCollision(oWall, true);
		}
		if (place_meeting(x,y+vsp,oPaletteWall) && !swimming && global.color != 1)
		{
			DoCollision(oPaletteWall, true);
		}
		x = x + hsp;
		//apply gravity if dashing in air
		if (jumped){
			vsp += grv;
			if (vsp > 0) vsp = 0;
		}
		y = y + vsp;
	}
	
}
}