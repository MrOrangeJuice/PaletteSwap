if(!global.paused && !global.textUp && global.canControlTimer < 0){
	//Spike collision
collidingSpikes = instance_place(x, y, oSpikes);
if(collidingSpikes != noone){
	if(!spikeImmune){
		spikeImmune = true;
			if (isInvulnerable == false) {
				global.hp -= 10;
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
	if(collidingSpikes == noone){
	if(bottomWall){
		inst = instance_place(x, y+1, oWall);
		lastGroundedPosX = inst.x;
		lastGroundedPosY = inst.y - 24;
	}
	else{
		inst = instance_place(x, y+1, oPaletteWall);
		lastGroundedPosX = inst.x;
		lastGroundedPosY = inst.y - 24;
	}
	}
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
			//walking through water
				DoCollision(oPaletteWall, false);
				currentwalksp = 0;
			break;
			case 1:
				//currentwalksp /= 1.2;
				hsp /= 2;
			break;
		}
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
				swimming = true;
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
			instance_create_layer(x, y+vsp,"Coins",oDashFX);
			//collide with wall
			DoDashCollision(oWall, -11, 0, true);
		}
		if (place_meeting(x,y+vsp,oPaletteWall))
		{
			switch (global.color)
			{
			case 0:
			//if green collide with wall
				DoDashCollision(oPaletteWall, -11, 0, true);
				swimming = false;
			break;
			case 1:
			//if blue enter water
				vsp /= 1.5;
				swimming = true;
			break;
			}
		}
		y = y + vsp;
	}
	if(dashright){
		// Horizontal Collision
		if (place_meeting(x+hsp,y,oWall))
		{
			DoDashCollision(oWall, -7, -6, false);
		}
		//palette block
		if (place_meeting(x+hsp,y,oPaletteWall))
		{
			switch (global.color){
			case 0:
				DoDashCollision(oPaletteWall, -7, -6, false);
				swimming = false;
			break;
			case 1:
				hsp /= 1.5;
				swimming = true;
			break;
			}
		}
		else swimming = false;
		// Vertical Collision
		if (place_meeting(x,y+vsp,oWall))
		{
			DoCollision(oWall, true);
		}
		if (place_meeting(x,y+vsp,oPaletteWall) && !swimming)
		{
			DoCollision(oPaletteWall, true);
		}
		x = x + hsp;
		//apply gravity if dashing in air
		if (jumped){
			vsp += grv;
		}
		y = y + vsp;
	}
	if(dashleft){
		// Horizontal Collision
		if (place_meeting(x+hsp,y,oWall))
		{
			DoDashCollision(oWall, -7, 6, false);
		}
		if (place_meeting(x+hsp,y,oPaletteWall))
		{
			switch (global.color){
			case 0:
				DoDashCollision(oPaletteWall, -7, 6, false);
				swimming = false;
			break;
			case 1:
				hsp /= 1.5;
				swimming = true;
			break;
			}
		}
		else swimming = false;
		// Vertical Collision
		if (place_meeting(x,y+vsp,oWall))
		{
			DoCollision(oWall, true);
		}
		if (place_meeting(x,y+vsp,oPaletteWall) && !swimming)
		{
			DoCollision(oPaletteWall, true);
		}
		x = x + hsp;
		//apply gravity if dashing in air
		if (jumped){
			vsp += grv;
		}
		y = y + vsp;
	}
}
}