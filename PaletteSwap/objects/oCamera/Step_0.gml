/// @description Update camera
// Update destination
if (instance_exists(oPlayer))
{
	follow = oPlayer;
	xTo = follow.x;
	yTo = follow.y;
	jelliness = 2;
}	
else
{
	if (instance_exists(oShip))
	{
		follow = oShip;
		xTo = follow.x;
		yTo = follow.y;
		jelliness = 1;
	}	
}

// Update object position
x += (xTo - x) / jelliness;
y += (yTo - y) / jelliness;

// Keep camera center inside room
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

// Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

// Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

if (layer_exists("GreenClouds"))
{
	layer_x("GreenClouds",x/4);
	layer_y("GreenClouds",y/4);
}

if (layer_exists("BlueClouds"))
{
	layer_x("BlueClouds",x/4);
	layer_y("BlueClouds",y/4);
}