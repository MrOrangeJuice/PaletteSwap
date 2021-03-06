if(!global.paused && !global.textUp){
	//Spike collision
collidingSpikes = instance_place(x, y, oSpikes);
if(collidingSpikes != noone){
	if(!spikeImmune){
		spikeImmune = true;
		global.hp -= 10;
		if(collidingSpikes.isPit){
			oPlayer.x = lastGroundedPosX;
			oPlayer.y = lastGroundedPosY;
		}
		else{
			InitiateKnockback(oPlayer, 6, -7);
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
else if ((swimming && (vsp == 0 || vsp > 0.6)) || !swimming){
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
	jumped = false;
	// Reset roll
	isRolling = false;
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
				vsp /= 1.25;
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
			break;
			case 1:
			//if blue enter water
				vsp /= 1.5;
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