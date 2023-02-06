/// @description Initialize Variables

hsp = 0;
vsp = 0;
grv = 0.4;
walksp = 4.5;
dashsp = 8;
blueDashSp = 0;
dashtime = room_speed * 0.3;
dashEnd = 0;
dashdown = false;
dashleft = false;
dashright = false;
dashup = false;
swimup = false;
currentwalksp = 0;
airborne = false;
prevAirborne = false;
canDash = true;
isDashing = false;
isRolling = false;
canJump = true;
jumpVar = true;
jumpBuffer = 0;
jumped = false; //purely to stop jumpdash
skidSound = true;
exiting = false;
wallHit = false;
swimming = false;
wallgrab = false;
spikeImmune = false;
lastGroundedPosX = 0;
lastGroundedPosY = 0;
villager = false;
canSwap = true;
bottomWall = false;
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

currentframe = 0;

global.wasDashReset = false;
useCurrentDoorSpawn = false;

//dialog settings
face = sFernPortrait; //sprite
eName = "Fern";

//how about not breaking on entering rooms?
global.isEnteringDoor = false;

if(global.useCurrentDoorSpawn){
	useCurrentDoorSpawn = true;
}