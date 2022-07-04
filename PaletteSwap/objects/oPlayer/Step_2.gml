if(useCurrentDoorSpawn){
	global.useCurrentDoorSpawn = false;
	global.isEnteringDoor = true;
	useCurrentDoorSpawn = false;
	for (i = 0; i < instance_number(oLevelDoor); i++){
		currentInstance = instance_find(oLevelDoor, i);
		if(currentInstance.doorId == global.currentDoorId){
			x = currentInstance.x;
			y = currentInstance.y;
		}
	}
	if (!global.skipPortalAnimation) {
		SwapSprite(sFernPortal);
	}
	alarm[4] = room_speed * .5;
	
}

if(!global.paused && !global.textUp && !global.isEnteringDoor){
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
				isDashing = false;
				audio_play_sound(snd_Damage, 5, false);
		}
	}
}
else{
	spikeImmune = false;
}
	bottomWall = place_meeting(x, y+1, oWall) || (place_meeting(x, y+1, oOneWayWall) && !place_meeting(x, y+0, oOneWayWall));
	bottomPalette = place_meeting(x, y+1, oPaletteWall);
if (!bottomWall && !bottomPalette && !wallgrab)
{
	airborne = true;
}
else if ((swimming && (vsp >= 0 || dashup)) || !swimming){
	airborne = false;
	// Reset jump buffer
	jumpBuffer = 5;
	if (!isDashing)	{
		jumped = false;
	}
	// Reset roll
	if (canDash && !(bottomPalette && global.color == 1) && isRolling && !wallgrab){
		//get colliding onewaywall
		collWall = instance_place(x,y,oOneWayWall);
			//there is no OWW     there is vertical wall & player moves opposite way
		if (collWall == noone || (collWall.dirVert && collWall.dir = sign(vsp)) ) {
			y -= 6; //stop edge clip on landing roll lmao
			isRolling = false;
		}
	}
}

//skidding check
if ( ((hsp > 2 || (skidding && hsp > 0)) && key_left) || ((hsp < -2 || (skidding && hsp < 0)) && key_right) ) {
	skidding = true;
}
else skidding = false;

if(!isInvulnerable)
{
	// Destroy if caught between piston and ceiling
	if (place_meeting(x,y+1,oPiston) && place_meeting(x,y-1,oWall))
	{
		global.hp -= 100;
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
			walksp -= 0.07
		}
		else if (walksp < 4.5){
			walksp = 4.5;
		}
	
	x = x + hsp;

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		//if(prevAirborne && bottomWall && vsp >= 2 && !isDashing) instance_create_layer(x, y+6,"Coins",oFallFX);
		DoCollision(oWall, true);
		if(bottomWall) prevAirborne = false;
	}
	else
	{
		prevAirborne = true;
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
				if (bottomPalette) walksp = 9;
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
	if(dashdown || dashup){
		// Handle Vertical Collision Normally
		if (place_meeting(x,y+vsp,oWall))
		{
			wallY = 0;
			while (!place_meeting(x,y+wallY,oWall))
			{
				wallY = wallY + sign(vsp);
			}
			FX = instance_create_layer(x, y+wallY,"Coins",oDashFX);
			if (dashup) {
				FX.image_angle = 180;
			}
			//collide with wall    |  -11 down, 5 up  |
			DoDashCollision(oWall, (sign(vsp) * -8) - 3, 0, true);
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
				fx = instance_create_layer(x, y+wallY,"Coins",oDashFX);
				if (dashup) {
					fx.image_angle = 180;
				}
				DoDashCollision(oPaletteWall, (sign(vsp) * -8) - 3, 0, true);
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
				if (dashup) {
					FX.image_angle = 180;
				}
				DoDashCollision(oPaletteWall, (sign(vsp) * -8) - 3, 0, true);
				swimming = false;
			break;
			case 3:
			//todo red
				instance_create_layer(x, y+wallY,"Coins",oDashFX);
				if (dashup) {
					FX.image_angle = 180;
				}
				DoDashCollision(oPaletteWall, (sign(vsp) * -8) - 3, 0, true);
				swimming = false;
			break;
			}
		}
		else {swimming = false;}
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
				//align with wall
				while (!place_meeting(x+sign(hsp),y,oPaletteWall))
				{
					x += sign(hsp);
				}
				wallgrab = true;
				canDash = true;
				dashleft = false;
				dashright = false;
				dashup = true;
				swimming = false;
				canJump = true;
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

if(place_meeting(x,y+1,oConveyer) && currentwalksp == 0) {
	if (key_left && !key_right && place_meeting(x +1, y, oAbstractWallBase)) {
		x--;
	}

	if (!key_left && key_right && place_meeting(x -1, y, oAbstractWallBase)) {
		x++;
	}
}
}