/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
currentframe = 0;
info = 0;
createdInfo = false;
portal = instance_create_layer(x,y,"Portals",oPortal);
if (levelTo == "rMomentumMotel" || levelTo == "rShack")
{
	portal.image_alpha = 0;
}
portal.visible = false;