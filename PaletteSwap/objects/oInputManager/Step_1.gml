/// @description Read input
// You can write your code in this editor
global.leftKeyHeld = keyboard_check(leftKeyStore);
global.rightKeyHeld = keyboard_check(rightKeyStore);
global.downKeyHeld = keyboard_check(downKeyStore);
global.upKeyHeld = keyboard_check(upKeyStore);

global.jumpKeyHeld = keyboard_check(jumpKeyStore) || keyboard_check(jumpAltKeyStore);
global.jumpKeyRelease = keyboard_check_released(jumpKeyStore) || keyboard_check_released(jumpAltKeyStore);

global.dashKeyPress = keyboard_check_pressed(dashKeyStore) || keyboard_check_pressed(dashAltKeyStore);

global.swapDownKeyPress = keyboard_check_pressed(swapDownKeyStore) || keyboard_check_pressed(swapDownAltKeyStore);
global.swapUpKeyPress = keyboard_check_pressed(swapUpKeyStore) || keyboard_check_pressed(swapUpAltKeyStore);
global.p1KeyPress = keyboard_check_pressed(palette1KeyStore);
global.p2KeyPress = keyboard_check_pressed(palette2KeyStore);
global.p3KeyPress = keyboard_check_pressed(palette3KeyStore);
global.p4KeyPress = keyboard_check_pressed(palette4KeyStore);

global.signKeyPress = keyboard_check_pressed(continueKeyStore);
global.continueRelease = keyboard_check_released(continueKeyStore) || keyboard_check_released(continueAltKeyStore)|| global.jumpKeyRelease;

if (keyboard_check(vk_anykey))
{
	global.controller = 0;
}

//Controller Code
if (gamepad_axis_value(0,gp_axislh) < -0.4 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.4 || gamepad_button_check(4,gp_padl))
{
	global.leftKeyHeld = 1;
	global.controller = 1;
}
if (gamepad_axis_value(0,gp_axislh) > 0.4 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.4 || gamepad_button_check(4,gp_padr))
{
	global.rightKeyHeld = 1;
	global.controller = 1;
}													//better input priority determination on analog stick
if ( (gamepad_axis_value(0,gp_axislv) > 0.4 && gamepad_axis_value(0,gp_axislv) > abs(gamepad_axis_value(0,gp_axislh))) || gamepad_button_check(0,gp_padd) || (gamepad_axis_value(4,gp_axislv) > 0.4 && gamepad_axis_value(4,gp_axislv) > abs(gamepad_axis_value(4,gp_axislh))) || gamepad_button_check(4,gp_padd))
{
	global.downKeyHeld = 1;
	global.controller = 1;
}
if ( (gamepad_axis_value(0,gp_axislv) < -0.4 && gamepad_axis_value(0,gp_axislv) < -1 * abs(gamepad_axis_value(0,gp_axislh))) || gamepad_button_check(0,gp_padu) || (gamepad_axis_value(4,gp_axislv) < -0.4 && gamepad_axis_value(4,gp_axislv) < -1 * abs(gamepad_axis_value(4,gp_axislh))) || gamepad_button_check(4,gp_padu))
{
	global.upKeyHeld = 1;
	global.controller = 1;
}


if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	global.jumpKeyHeld = 1;
	global.controller = 1;
}
if (gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1))
{
	global.jumpKeyRelease = 1;
	global.controller = 1;
}


if (gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(4,gp_face3) || gamepad_button_check_pressed(4,gp_face2))
{
	global.dashKeyPress = 1;
	global.controller = 1;
}


if (gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(4,gp_shoulderl) || gamepad_button_check_pressed(4,gp_shoulderl))
{
	global.swapDownKeyPress = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(4,gp_shoulderr) || gamepad_button_check_pressed(4,gp_shoulderr))
{
	global.swapUpKeyPress = 1;
	global.controller = 1;
}

if ( (gamepad_axis_value(0,gp_axisrv) < -0.4 && gamepad_axis_value(0,gp_axisrv) < -1 * abs(gamepad_axis_value(0,gp_axisrh))) || (gamepad_axis_value(4,gp_axisrv) < -0.4 && gamepad_axis_value(4,gp_axisrv) < -1 * abs(gamepad_axis_value(4,gp_axisrh))) )
{ //up
	global.p1KeyPress = 1;
	global.controller = 1;
}
if ( (gamepad_axis_value(0,gp_axisrv) > 0.4 && gamepad_axis_value(0,gp_axisrv) > abs(gamepad_axis_value(0,gp_axisrh))) || (gamepad_axis_value(4,gp_axisrv) > 0.4 && gamepad_axis_value(4,gp_axisrv) > abs(gamepad_axis_value(4,gp_axisrh))) )
{ //down
	global.p3KeyPress = 1;
	global.controller = 1;
}
if ( (gamepad_axis_value(0,gp_axisrh) < -0.4 && gamepad_axis_value(0,gp_axisrh) < -1 * abs(gamepad_axis_value(0,gp_axisrv))) || (gamepad_axis_value(4,gp_axisrh) < -0.4 && gamepad_axis_value(4,gp_axisrh) < -1 * abs(gamepad_axis_value(4,gp_axisrv))) )
{ //left
	global.p4KeyPress = 1;
	global.controller = 1;
}
if ( (gamepad_axis_value(0,gp_axisrh) > 0.4 && gamepad_axis_value(0,gp_axisrh) > abs(gamepad_axis_value(0,gp_axisrv))) || (gamepad_axis_value(4,gp_axisrh) > 0.4 && gamepad_axis_value(4,gp_axisrh) > abs(gamepad_axis_value(4,gp_axisrv))) )
{ //right
	global.p2KeyPress = 1;
	global.controller = 1;
}


if (gamepad_button_check_pressed(0,gp_face4) || gamepad_button_check_pressed(4,gp_face4))
{
	global.signKeyPress = 1;
	global.controller = 1;
}
if (gamepad_button_check_released(0,gp_face4) || gamepad_button_check_released(4,gp_face4) || gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1))
{
	global.continueRelease = 1;
	global.controller = 1;
}