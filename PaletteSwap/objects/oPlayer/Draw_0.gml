/// @description Render player

draw_self();

if(!canDash && !isDashing)
{
	shader_set(shDark);
	draw_self();
	shader_reset();
}