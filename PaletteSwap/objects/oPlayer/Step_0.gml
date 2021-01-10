/// @description Update Physics

// Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(ord("P")) || keyboard_check(vk_space);
key_jump_released = keyboard_check_released(ord("P")) || keyboard_check_released(vk_space);
key_down = keyboard_check(ord("S"));
key_dash = keyboard_check_pressed(ord("O")) || keyboard_check_pressed(vk_lshift);
key_up = keyboard_check(ord("W"));
key_swap = keyboard_check_released(ord("I")) || keyboard_check_released(ord("Q"));

if (key_left) || (key_right) || (key_jump) || (key_dash) || (key_down) || (key_up) || (key_jump_released) || (key_swap)
{
	controller = 0;
}

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.4 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.4 || gamepad_button_check(4,gp_padl))
{
	key_left = 1;
	controller = 1;
}

if (gamepad_axis_value(0,gp_axislh) > 0.4 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.4 || gamepad_button_check(4,gp_padr))
{
	key_right = 1;
	controller = 1;
}

if (gamepad_axis_value(0,gp_axislv) > 0.4 || gamepad_button_check(0,gp_padd) || gamepad_axis_value(4,gp_axislv) > 0.4 || gamepad_button_check(4,gp_padd))
{
	key_down = 1;
	controller = 1;
}

if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_jump = 1;
	controller = 1;
}
if (gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1))
{
	key_jump_released = 1;
}

if (gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(4,gp_face3) || gamepad_button_check_pressed(4,gp_face2))
{
	key_dash = 1;
	controller = 1;
}
if (gamepad_axis_value(0,gp_axislv) < -0.4 || gamepad_button_check(0,gp_padu) || gamepad_axis_value(4,gp_axislv) < -0.4 || gamepad_button_check(4,gp_padu))
{
	key_up = 1;
	controller = 1;
}

if (gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(3,gp_shoulderr) || gamepad_button_check_pressed(3,gp_shoulderl))
{
	key_swap = 1;
	controller = 1;
}

// If player doesn't release jump, they can't jump again
if(key_jump_released)
{
	canJump = true;
}

// Decrement jump buffer
jumpBuffer -= 1;
if (jumpBuffer > 0) && (key_jump) && (canJump)
{
	jumpBuffer = 0;
	vsp = -10;
	audio_play_sound(snd_Jump, 5, false);
	canJump = false;
}

// Check if player is airborne
if (!place_meeting(x,y+1,oWall))
{
	airborne = true;
}
else 
{
	airborne = false;
	// Reset jump buffer
	jumpBuffer = 5;
}

// Check if player can dash
if (isDashing)
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
}

// If player is dashing, don't worry about other inputs
if(!isDashing)
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
	
	// Restore ability to variably jump once the bounce hits its apex
	if (vsp > 0)
	{
		jumpVar = true;	
	}

	// Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
		currentwalksp = 0;
	}
	x = x + hsp;

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}
// Dash
else
{
	// If a direction has not been picked yet, pick one
	if(!dashdown && !dashleft && !dashright)
	{
		// Reset currentwalksp and vsp
		vsp = 0;
		currentwalksp = 0;
		
		// Play dash sound
		audio_play_sound(snd_Dash, 5, false);
		
		if(key_right)
		{
			dashright = true;	
		}
		else if(key_left)
		{
			dashleft = true;	
		}
		else if(key_down)
		{
			dashdown = true;	
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
		vsp = dashsp * 1.5;
		// Handle Vertical Collision Normally
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp);
			}
			// If you hit the ground, pop up and reenable dash
			vsp = -11;
			isDashing = false;
			alarm[0] = room_speed * 0.3;
			dashtime = room_speed * 0.25;
			// Reset dash direction
			dashdown = false;
			dashleft = false;
			dashright = false;
			// Reset dash ability
				//canDash = true;
			// Disable variable jump
			jumpVar = false;
			// Play sound effect
			audio_play_sound(snd_Thud, 5, false);
		}
		y = y + vsp;
	}
	if(dashright)
	{
		hsp = dashsp;
		// Horizontal Collision
		if (place_meeting(x+hsp,y,oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x + sign(hsp);
			}
			// Bounce off wall
			currentwalksp = -6;
			hsp = currentwalksp;
			vsp = -7;
			
			isDashing = false;
			alarm[0] = room_speed * 0.3;
			dashtime = room_speed * 0.25;
			// Reset dash direction
			dashdown = false;
			dashleft = false;
			dashright = false;
			// Reset dash ability
				//canDash = true;
			// Disable variable jump
			jumpVar = false;
			// Play sound effect
			audio_play_sound(snd_Thud, 5, false);
		}
		// Vertical Collision
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}
		x = x + hsp;
		y = y + vsp;
	}
	if(dashleft)
	{
		hsp = -dashsp;
		// Horizontal Collision
		if (place_meeting(x+hsp,y,oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x + sign(hsp);
			}
			// Bounce off wall
			currentwalksp = 6;
			hsp = currentwalksp;
			vsp = -7;
			
			isDashing = false;
			alarm[0] = room_speed * 0.3;
			dashtime = room_speed * 0.25;
			// Reset dash direction
			dashdown = false;
			dashleft = false;
			dashright = false;
			// Reset dash ability
				//canDash = true;
			// Disable variable jump
			jumpVar = false;
			// Play sound effect
			audio_play_sound(snd_Thud, 5, false);
		}
		// Vertical Collision
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp);
			}
			vsp = 0;
		}
		x = x + hsp;
		y = y + vsp;
	}
	
	// Decrement timer and end dash if necessary
	// Up dash doesn't last as long
	// Down dash only ends when you touch the ground
	if(!dashdown)
	{
		dashtime--;
	}
	
	// If timer is up
	if(dashtime <= 0)
	{
		isDashing = false;
		dashtime = room_speed * 0.25;
		// Reset dash direction
		dashdown = false;
		dashleft = false;
		dashright = false;
	}
}


// Animation

if(airborne)
{
	if(vsp < 0)
	{
		//sprite_index = sFernJumpUp;
		SwapSprite(sFernJumpUp, false);
	}
	else
	{
		//sprite_index = sFernJumpDown;
		SwapSprite(sFernJumpDown, true);
	}
}
else
{
	if (sign(hsp) == 0 && ( !(key_left || key_right) || (key_left && key_right) ) )
	{
		//sprite_index = sFernIdle;
		SwapSprite(sFernIdle, true);
	}
	else if (hsp > 2 && key_left)
	{
		//sprite_index = sFernSkid;	
		SwapSprite(sFernSkid, false);
		if(skidSound)
		{
			audio_play_sound(snd_Skid, 5, false);	
		}
		skidSound = false;
	}
	else if (hsp < -2 && key_right)
	{
		//sprite_index = sFernSkid;	
		SwapSprite(sFernSkid, false);
		if(skidSound)
		{
			audio_play_sound(snd_Skid, 5, false);	
		}
		skidSound = false;
	}
	else
	{
		skidSound = true;
		//sprite_index = sFernRun;
		SwapSprite(sFernRun, false);
	}
}

if ((key_right - key_left) != 0) image_xscale = sign((key_right - key_left));

// Palette Swap
if (key_swap){
	global.color++;
	if (global.color >= global.color_limit) global.color = 0;
}

//update frame
PaletteAnimationSwap();