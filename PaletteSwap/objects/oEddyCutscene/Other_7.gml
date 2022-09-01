/// @description Switch to other cutscene and start accepting player input
//instance_change(oEddyCutsceneEnd, true);
//initiate dialog
instance_find(oDialogTrigger, 0).dormant = false;
instance_find(oDialogTrigger, 1).dormant = false;
global.cutscene = false;
global.paused = false;
visible = false;
alarm[0] = room_speed * 0.5;