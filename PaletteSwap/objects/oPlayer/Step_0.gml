// Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(ord("P"));
key_jump_released = keyboard_check_released(ord("P"));
key_duck = keyboard_check(ord("S"));
key_run = keyboard_check(ord("O"));
key_up = keyboard_check(ord("W"));

if (key_left) || (key_right) || (key_jump) || (key_run) || (key_duck) || (key_up) || (key_jump_released)
{
	controller = 0;
}

	// Gamepad input
	if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
	{
		key_left = 1;
		controller = 1;
	}


	if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
	{
		key_right = 1;
		controller = 1;
	}

	if (gamepad_axis_value(0,gp_axislv) > 0.4 || gamepad_button_check(0,gp_padd) || gamepad_axis_value(4,gp_axislv) > 0.4 || gamepad_button_check(4,gp_padd))
	{
		key_duck = 1;
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
		controller = 1;
	}

	if (gamepad_button_check(0,gp_face3) || gamepad_button_check(0,gp_face2) || gamepad_button_check(4,gp_face3) || gamepad_button_check(4,gp_face2))
	{
		key_run = 1;
		controller = 1;
	}
	// Gamepad input
	if (gamepad_axis_value(0,gp_axislv) < -0.4 || gamepad_button_check(0,gp_padu) || gamepad_axis_value(4,gp_axislv) < -0.4 || gamepad_button_check(4,gp_padu))
	{
		key_up = 1;
		controller = 1;
	}
	
	// Set movement to 0 if ducking
	if(key_duck)
	{
		key_right = 0;
		key_left = 0;
	}

	// Calculate Movement
	if(airborne)
	{
		// If player released run in midair, they can't run again until they hit the ground
		if(key_run == false)
		{
			runInAir = false;
		}
	}
	
	// If player doesn't release jump, they can't jump again
	if(key_jump_released)
	{
		canJump = true;
	}

	// Check run
	if (key_run && runInAir)
	{
		walksp = 6;
		running = true;
	}
	else
	{
		walksp = 4;
		running = false;	
	}
	
	// Build up speed depending on inputs
	if(key_left)
	{
		currentwalksp -= 0.25;
		if(currentwalksp < -walksp)
		{
			currentwalksp = -walksp;
		}
	}
	if(key_right)
	{
		// Turn faster in the air
		currentwalksp += 0.25;
		if(currentwalksp > walksp)
		{
			currentwalksp = walksp;
		}
	}
	if (!key_left && !key_right)
	{
		if(currentwalksp < 0)
		{
			currentwalksp += 0.2;
			// Round up
			if(currentwalksp > -0.05)
			{
				currentwalksp = 0;	
			}
		}
		if(currentwalksp > 0)
		{
			currentwalksp -= 0.2;	
			// Round down
			if(currentwalksp < 0.05)
			{
				currentwalksp = 0;	
			}
		}
	}

	hsp = currentwalksp;

	vsp = vsp + grv;

	// Decrement jump buffer
	jumpBuffer -= 1;
	if (jumpBuffer > 0) && (key_jump) && (canJump)
	{
		jumpBuffer = 0;
		if(key_run && abs(hsp) > 5) 
		{
			vsp = -13;
		}
		else 
		{
			vsp = -12;
		}
		audio_play_sound(snd_Jump, 5, false);
		canJump = false;
	}

	// Variable jump height
	if vsp < 0 && (!(key_jump)) //if you're moving upwards in the air but not holding down jump
	{
		vsp *= 0.85; //essentially, divide your vertical speed
	}

	if (!place_meeting(x,y+1,oWall))
	{
		airborne = true;
	}
	else 
	{
		airborne = false;
		// Reset air run
		runInAir = true;
		// Reset jump buffer
		jumpBuffer = 5;
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

/*
	// Animation
	if (!place_meeting(x,y+1,oWall))
	{
		skidSound = true;
		sprite_index = sMarioJump;
		image_speed = 0;	
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else 
	{
		if(running)
		{
			image_speed = 2;	
		}
		else
		{
			image_speed = 1;
		}
		if (sign(hsp) == 0)
		{
			sprite_index = sMarioIdle;
		}
		else if (hsp > 2 && key_left)
		{
			sprite_index = sMarioTurn;	
			if(skidSound)
			{
				audio_play_sound(snd_Skid, 5, false);	
			}
			skidSound = false;
		}
		else if (hsp < -2 && key_right)
		{
			if(skidSound)
			{
				audio_play_sound(snd_Skid, 5, false);	
			}
			skidSound = false;
			sprite_index = sMarioTurn;	
		}
		else
		{
			skidSound = true;
			sprite_index = sMarioRun;
		}
	}

	// Duck
	if (place_meeting(x,y+1,oWall)) && (key_duck)
	{
		sprite_index = sMarioDuck;
		crouching = true;
	}
	else
	{
		crouching = false;
	}
}
*/