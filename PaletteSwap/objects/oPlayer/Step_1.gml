/// @description Update Physics
// Get Player Input
if (global.canControlTimer < 0) {
key_left = keyboard_check(global.leftKey);
key_right = keyboard_check(global.rightKey);
key_jump = keyboard_check(global.jumpKey) || keyboard_check(global.jumpAltKey);
key_jump_released = keyboard_check_released(global.jumpKey) || keyboard_check_released(global.jumpAltKey);
key_down = keyboard_check(global.downKey);
key_dash = 0;
if(window_has_focus()) key_dash = keyboard_check_pressed(global.dashKey) || keyboard_check_pressed(global.dashAltKey);
key_up = keyboard_check(global.upKey);
key_swap_down = keyboard_check_pressed(global.swapDownKey) || keyboard_check_pressed(global.swapDownAltKey);
key_swap_up = keyboard_check_pressed(global.swapUpKey) || keyboard_check_pressed(global.swapUpAltKey);

if (key_left) || (key_right) || (key_jump) || (key_dash) || (key_down) || (key_up) || (key_jump_released) || (key_swap_up) || (key_swap_down)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.4 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.4 || gamepad_button_check(4,gp_padl))
{
	key_left = 1;
	global.controller = 1;
}

if (gamepad_axis_value(0,gp_axislh) > 0.4 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.4 || gamepad_button_check(4,gp_padr))
{
	key_right = 1;
	global.controller = 1;
}

if (gamepad_axis_value(0,gp_axislv) > 0.9 || gamepad_button_check(0,gp_padd) || gamepad_axis_value(4,gp_axislv) > 0.9 || gamepad_button_check(4,gp_padd))
{
	key_down = 1;
	global.controller = 1;
}

if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1) && !global.textUp)
{
	key_jump = 1;
	global.controller = 1;
}
if (gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1) && !global.textUp)
{
	key_jump_released = 1;
}

if (gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(4,gp_face3) || gamepad_button_check_pressed(4,gp_face2))
{
	key_dash = 1;
	global.controller = 1;
}

if (gamepad_axis_value(0,gp_axislv) < -0.9 || gamepad_button_check(0,gp_padu) || gamepad_axis_value(4,gp_axislv) < -0.9 || gamepad_button_check(4,gp_padu))
{
	key_up = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(4,gp_shoulderl) || gamepad_button_check_pressed(4,gp_shoulderl))
{
	key_swap_down = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(4,gp_shoulderr) || gamepad_button_check_pressed(4,gp_shoulderr))
{
	key_swap_up = 1;
	global.controller = 1;
}
} else {
key_left = 0;
key_right = 0;
key_jump = 0;
key_jump_released = 0;
key_down = 0;
key_dash = 0;
key_dash = 0;
key_up = 0;
key_swap_down = 0;
key_swap_up	= 0;
}

// Prevent player from swapping in certain rooms
if(room == rTutorial || room == rTutorial2 || !canSwap)
{
	key_swap_down = 0;
	key_swap_up = 0;
}

if(!global.paused && !global.textUp && !global.isEnteringDoor){

//orient sprite
if ((key_right - key_left) != 0 && !isDashing && !wallgrab) image_xscale = sign((key_right - key_left));
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
		if(global.canControlTimer < 0) vsp = dashsp * 1.5;
	}
	else if (dashup){
		if(global.canControlTimer < 0) vsp = dashsp * -0.9;
	}
	else if(dashright)
	{
		if(global.canControlTimer < 0) hsp = dashsp;
	}
	else if(dashleft)
	{
		if(global.canControlTimer < 0) hsp = -dashsp;
	}
	
	// Decrement timer and end dash if necessary
	// Down dash only ends when you touch the ground
	dashtime--;
	
	// If timer is up
	if(dashtime <= 0 && !dashdown && !swimming && !wallgrab)
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
else if(wallgrab)
{
	if(key_up)
	{
		SwapSprite(sFernClimbUp);
	}
	else if(image_xscale == 1 && key_left)
	{
		SwapSprite(sFernClimbLook);	
	}
	else if(image_xscale == -1 && key_right)
	{
		SwapSprite(sFernClimbLook);	
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
	global.color++;
	if (global.color >= global.color_limit) global.color = 0;
	// Create swapping effects
	instance_create_layer(x,y,"FX",oRift);
	audio_play_sound(snd_Swap,5,false);
	ScreenShake(2,10);
	canSwap = false;
	alarm[2] = room_speed * 0.2;
}
if (key_swap_down && !swimming && room != rTutorial){
	global.color--;
	if (global.color < 0) global.color = global.color_limit - 1;
	// Create swapping effects
	instance_create_layer(x,y,"FX",oRift);
	audio_play_sound(snd_Swap,5,false);
	ScreenShake(2,10);
	canSwap = false;
	alarm[2] = room_speed * 0.2;
}
if ((key_swap_down || key_swap_up) && swimming)
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