/// @description Update camera
// Update destination
if (instance_exists(oPlayer))
{
	follow = oPlayer;
	xTo = follow.x;
	yTo = follow.y;
	jelliness = 4;
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
//special camera placement for momentum motel
if (room == rMomentumMotel){
	yTo -= RES_H / 6; //position fern at the lower 1/3 line across the screen
}
if (global.useDialogCam){
	yTo += RES_H / 6;
}

// Update object position
dX = (xTo - x) / jelliness;
dY = (yTo - y) / jelliness;

//reduce subpixel movement
if (abs(dX) < 0.5) dX = 0;
if (abs(dY) < 0.5) dY = 0;

x += dX;
y += dY;

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
	layer_x("GreenClouds",x/6);
	layer_y("GreenClouds",y/6);
}

if (layer_exists("BlueClouds"))
{
	layer_x("BlueClouds",x/6);
	layer_y("BlueClouds",y/6);
}

if (layer_exists("RedClouds"))
{
	layer_x("RedClouds",x/6);
	layer_y("RedClouds",y/6);
}

if (layer_exists("PurpleClouds"))
{
	layer_x("PurpleClouds",x/6);
	layer_y("PurpleClouds",y/6);
}