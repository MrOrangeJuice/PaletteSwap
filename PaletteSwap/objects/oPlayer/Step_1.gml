/// @description Update Physics
// Get Player Input

if (global.canControlTimer < 0) {
key_left = global.leftKeyHeld;
key_right = global.rightKeyHeld;
key_jump = global.jumpKeyHeld;
key_jump_released = global.jumpKeyRelease;
key_down = global.downKeyHeld;
key_dash = global.dashKeyPress;
key_up = global.upKeyHeld;
key_swap_down = global.swapDownKeyPress;
key_swap_up = global.swapUpKeyPress;
key_swap_one = global.p1KeyPress;
key_swap_two = global.p2KeyPress;
key_swap_three = global.p3KeyPress;
key_swap_four = global.p4KeyPress;
} else {
key_left = 0;
key_right = 0;
key_jump = 0;
key_jump_released = 0;
key_down = 0;
key_dash = 0;
key_up = 0;
key_swap_down = 0;
key_swap_up	= 0;
key_swap_one = 0;
key_swap_two = 0;
key_swap_three = 0;
key_swap_four = 0;
}


// Prevent player from swapping in certain rooms
if(room == rTutorial || room == rTutorial2 || !canSwap)
{
	key_swap_up = 0;
	key_swap_down = 0;
	key_swap_one = 0;
	key_swap_two = 0;
	key_swap_three = 0;
	key_swap_four = 0;
}

if(!global.paused && !global.textUp && !global.isEnteringDoor){

//orient sprite
if ((key_right - key_left) != 0 && !isDashing && !wallgrab) image_xscale = sign(key_right - key_left);
// If player doesn't release jump, they can't jump again
if(key_jump_released)
{
	canJump = true;
}

sidewall = place_meeting(x + 2, y, oWall) || place_meeting(x - 2, y, oWall) || place_meeting(x + 2, y, oPaletteWall) || place_meeting(x - 2, y, oPaletteWall);

if ((!sidewall || global.color != 2 || bottomWall) && wallgrab){
	wallgrab = false;
	if (vsp < 0 && !isDashing){
		vsp -= 4;
		currentwalksp = image_xscale * 3;
	}
}

// Decrement jump buffer
jumpBuffer -= 1;
if (jumpBuffer > 0) && (key_jump) && (canJump)
{
	jumpBuffer = 0;
	if (swimming && isDashing)
	{
		thsp = 0;
		if (key_left && dashleft || key_right && dashright){
			thsp = dashsp;
		}
		DashReset();
		currentwalksp += image_xscale * thsp;
		isRolling = false;
	}
	if (swimming)
	{
		swimup = true;
		alarm[3] = room_speed / 3;
		currentframe = 0;
	}
	if(global.canControlTimer < 0) vsp = -10;
	audio_play_sound(snd_Jump, 5, false);
	canJump = false;
	// Spawn VFX
	if(!swimming && !wallgrab) instance_create_layer(x,y+8,"FX",oDustFX);
	if (wallgrab && global.canControlTimer < 0){
		wallgrab = false;
		vsp = -5.8;
		currentwalksp += image_xscale * -7.6;
		canDash = false;
		DashReset();
		isRolling = false;
	}
	jumped = true;
	global.knockedBack = false;
}
// Check if player can dash
if (isDashing && !wallgrab && !global.wasDashReset)
{
	canDash = false;
}
else if (!canDash && airborne)
{
	canDash = false;
}
else
{
	canDash = true;
}

// Check dash
if (key_dash && canDash)
{
	isDashing = true;
	global.knockedBack = false;
	dashup = false;
	dashdown = false;
	dashleft = false;
	dashright = false;
	jumped = false;
	global.wasDashReset = false;
}

// If player is dashing, don't worry about other inputs
if (wallgrab && !isDashing){
	if (key_up && !key_down){
		 vsp = -2;
	}
	else if (key_down && !key_up){
		 vsp = 2;
	}
	else vsp = 0;
}
else if(!isDashing)
{
	// Build up speed depending on inputs
	if(key_left && !key_right)
	{
		currentwalksp -= 0.25;
		if(currentwalksp < -walksp)
		{
			currentwalksp = -walksp;
		}
	}
	if(key_right && !key_left)
	{
		currentwalksp += 0.25;
		if(currentwalksp > walksp)
		{
			currentwalksp = walksp;
		}
	}
	// Slow down if not moving
	if (!(key_left || key_right) || (key_left && key_right))
	{
		if(currentwalksp < 0)
		{
			currentwalksp += 0.25;
			// Round up
			if(currentwalksp > -0.05)
			{
				currentwalksp = 0;	
			}
		}
		if(currentwalksp > 0)
		{
			currentwalksp -= 0.25;
			// Round down
			if(currentwalksp < 0.05)
			{
				currentwalksp = 0;	
			}
		}
	}
	hsp = currentwalksp;
	vsp = vsp + grv;

	// Variable jump height
	if vsp < 0 && (!(key_jump)) && jumpVar //if you're moving upwards in the air but not holding down jump
	{
		vsp *= 0.85; //essentially, divide your vertical speed
	}
	
}
// Dash
else
{
	// If a direction has not been picked yet, pick one
	if(!dashdown && !dashleft && !dashright && !dashup)
	{
		// Reset currentwalksp and vsp
		if(global.canControlTimer < 0) vsp = 0;
		currentwalksp = 0;
		
		// Play dash sound
		audio_play_sound(snd_Dash, 5, false);
		
		//dash out of wallgrab
		if (wallgrab){
			if (sign(image_xscale) == 1){
				dashleft = true;
				
			} else {
				dashright = true;
			}
			dashtime = room_speed * 0.3;
			image_xscale *= -1;
		}
		//normal dashes
		else if(key_down && (airborne || swimming))
		{
			dashdown = true;	
		}
		else if (key_up && swimming){
			dashup = true;	
		}
		else if(key_right && !key_left)
		{
			dashright = true;	
		}
		else if(key_left && !key_right)
		{
			dashleft = true;	
		}
		else
		{
			// If no direction is selected, dash the direction you're facing
			if(image_xscale == 1)
			{
				dashright = true;	
			}
			else if(image_xscale == -1)
			{
				dashleft = true;	
			}
		}
	}
	
	// Calculate movement
	if(dashdown)
	{
		if(global.canControlTimer < 0) vsp = (dashsp) * 1.5;
	}
	else if (dashup){
		if(global.canControlTimer < 0) vsp = (dashsp) * -0.9;
	}
	else if(dashright)
	{
		if(global.canControlTimer < 0) hsp = (dashsp);
	}
	else if(dashleft)
	{
		if(global.canControlTimer < 0) hsp = -(dashsp);
	}
	
	// Decrement timer and end dash if necessary
	// Down dash only ends when you touch the ground
	dashtime--;
	
	// If timer is up
	if(dashtime <= dashEnd && !dashdown && !swimming && !wallgrab)
	{
			if (place_meeting(x + (hsp * 2.5), y, oEnemy)){
				oEnemy.canHit = false;
			}
		isDashing = false;
		// Cancel roll if the dash ends without hitting a wall
		isRolling = false;
		dashtime = room_speed * 0.25;
		// Maintain momentum if holding direction
		if(dashleft)
		{
			if(key_left)
			{
				currentwalksp = -6;
			}
			else
			{
				currentwalksp = -1;	
			}
		}
		if(dashright)
		{
			if(key_right)
			{
				currentwalksp = 6;
			}
			else
			{
				currentwalksp = 1;	
			}
		}
		// Reset dash direction
		dashdown = false;
		dashleft = false;
		dashright = false;
		dashup = false;
	}
}

//clamp vsp
if (vsp > dashsp * 1.5){
	vsp = dashsp * 1.5;
}

if (isInvulnerable)
{
	iFrameCount += (delta_time / 1000000);

	// If the player has been invulnerable long-enough, then reset the iFrameCount and set the player to vulnerable.
	if (iFrameCount >= iFrameTime)
	{
		isInvulnerable = false;
		iFrameCount = 0;
	}
}
if(!global.isEnteringDoor){
// Animation
image_angle = 0;
if (global.knockedBack == true)
{
	SwapSprite(sFernHit);
}
else if(landing && abs(lastAirspeed) >= 8)
{
	SwapSprite(sFernLand);
}
else if(wallgrab)
{
	if((image_xscale == 1 && key_left) || (image_xscale == -1 && key_right))
	{
		SwapSprite(sFernClimbLook);	
	}
	else if(key_up)
	{
		SwapSprite(sFernClimbUp);	
	}
	else if(key_down)
	{
		SwapSprite(sFernClimbDown);	
	}
	else
	{
		SwapSprite(sFernClimb);	
	}
}
else if(isDashing)
{
	if(dashdown)
	{
		SwapSprite(sFernDashDown);	
	}
	else if(dashup){
		SwapSprite(sFernDashDown);
		image_angle	= 180;
	}
	else
	{
		SwapSprite(sFernDash);
	}	
}
else if(swimming)
{
	if(!swimup)
	{
		SwapSprite(sFernSwimNew);	
	}
	else
	{
		SwapSprite(sFernSwimUpNew);	
	}
}
else
{
	if(isRolling)
	{
		SwapSprite(sFernRoll);	
	}
	else
	{
		if(airborne)
		{
			if(vsp < 0)
			{
				//sprite_index = sFernJumpUp;
				SwapSprite(sFernJumpUp);
			}
			else
			{
				//sprite_index = sFernJumpDown;
				SwapSprite(sFernJumpDown);
			}
		}
		//run otherwise
		else
		{
			//idle
		if (sign(hsp) == 0 && ( !(key_left || key_right) || (key_left && key_right) ) && !exiting)
		{
			//sprite_index = sFernIdle;
			SwapSprite(sFernIdle2);
		}
		//slid r -> l
		else if (skidding)
		{
			//sprite_index = sFernSkid;	
			SwapSprite(sFernSkid);
			if(skidSound)
				{
					audio_play_sound(snd_Skid, 5, false);	
				}
				skidSound = false;
		}
			else
			{
				skidSound = true;
				skidding = false;
				//sprite_index = sFernRun;
				SwapSprite(sFernRunNew);
			}
		}
	}
}
}


// Palette Swap
if (key_swap_up && !swimming && room != rTutorial){
	SwapPalette(self, global.color + 1);
}
if (key_swap_down && !swimming && room != rTutorial){
	SwapPalette(self, global.color - 1);
}
if (key_swap_one && global.color != 0 && !swimming && room != rTutorial){
	SwapPalette(self, 0);
}
if (key_swap_two && global.color != 1 && !swimming && global.color_limit > 1 && room != rTutorial){
	SwapPalette(self, 1);
}
if (key_swap_three && global.color != 2 && !swimming && global.color_limit > 2  && room != rTutorial){
	SwapPalette(self, 2);
}
if (key_swap_four && global.color != 3 && !swimming && global.color_limit > 3  && room != rTutorial){
	SwapPalette(self, 3);
}

// Check if we need to change the player's dash because they changed palettes.
AdjustDashParams();

if ((key_swap_up || key_swap_down || key_swap_one || key_swap_two || key_swap_three || key_swap_four) && swimming)
{
	audio_play_sound(snd_NoSwap,5,false);
	ScreenShake(2,10);
}
if(global.hp <= 0){
	death = instance_create_layer(x,y,"Player",oPlayerDeath);
	death.villager = villager;
	if (instance_exists(oEddy)){
		death.canSwap = canSwap;
	}
	
	instance_create_layer(x,y,"Player",oGlasses);
	instance_destroy();
	
	// Check if we're in a speedrun level
	if (instance_exists(oSpeedrunEntry)) {
		SlideTransition(TRANS_MODE.GOTO, room);
		global.hp = 100;
	}
	
	/*
	global.hp = 100;
	global.canControlTimer = 60;
	oPlayer.vsp = 0;
	oPlayer.hsp = 0;
	x = global.lastCheckpointX;
	y = global.lastCheckpointY;
	*/
}

}
//update frame
PaletteAnimationSwap();