/// @description Initialize Variables

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4.5;
dashsp = 8;
dashtime = room_speed * 0.3;
dashdown = false;
dashleft = false;
dashright = false;
currentwalksp = 0;
airborne = false;
canDash = true;
isDashing = false;
isRolling = false;
canJump = true;
jumpVar = true;
jumpBuffer = 0;
jumped = false; //purely to stop jumpdash
skidSound = true;
wallHit = false;
swimming = false;
spikeImmune = false;
lastGroundedPosX = 0;
lastGroundedPosY = 0;
villager = false;
if(room == PaletteTempleLevel)
{
	canSwap = false;	
}

// Knockback variables.
global.knockedBack = false;

skidding = false; //skidding check

// I-Frame variables
iFrameTime = 1;
iFrameCount = 0;
isInvulnerable = false;

controller = 0;
global.controller = 0;

currentframe = 0;