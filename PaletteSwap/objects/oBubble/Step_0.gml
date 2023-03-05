/// @description Move up

y = y - 0.1;
if(dir == -1 && hsp = -0.3)
{
	dir = 1;
}
if(dir == 1 && hsp = 0.3)
{
	dir = -1;	
}

hsp += 0.03 * dir;
x += hsp;