/// @description Render player

/*
if(!canDash && !isDashing)
{
	shader_set(shDark);
	draw_self();
	shader_reset();
}
*/

if (isInvulnerable)
{
	shader_set(shTransparent);
}

draw_self();
shader_reset();