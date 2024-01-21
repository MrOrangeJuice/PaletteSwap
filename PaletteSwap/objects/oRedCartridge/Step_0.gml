/// @description Insert description here
// You can write your code in this editor

vsp += 0.05 * vdir;
if(vsp > 0.5 || vsp < -0.5) vdir *= -1;
y = y + vsp;
