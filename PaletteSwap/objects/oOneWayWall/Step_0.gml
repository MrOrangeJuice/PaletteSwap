//EntrySide: 0=Left, 1=Right, 2=Top, 3=Down
if(place_meeting(x-oPlayer.hsp,y-oPlayer.vsp, oPlayer)){
	if(!collidingWithPlayer){
		switch(EntrySide){
			case 0:
				if(oPlayer.hsp > 0){
					collidingWithPlayer = true;
				}
				break;
			case 1:
				if(oPlayer.hsp < 0){
					collidingWithPlayer = true;
				}
				break;
			case 2:
				if(oPlayer.vsp > 0){
					collidingWithPlayer = true;
				}
				break;
			case 3:
				if(oPlayer.vsp < 0){
					collidingWithPlayer = true;
				}
				break;
			default:
				break;
		}
		if(!collidingWithPlayer){
			if (place_meeting(x-oPlayer.hsp, y, oPlayer))
			{
				movingLeft = true;
				if(oPlayer.hsp > 0){
					movingLeft = false;
				}
			    while (!place_meeting(x-sign(oPlayer.hsp), y, oPlayer))
			    {
			        oPlayer.x += sign(oPlayer.hsp);
			    }
				if(movingLeft){
					oPlayer.x += .1;
				}
				else{
					oPlayer.x -= .1;
				}
			    oPlayer.hsp = 0;
			}
			if (place_meeting(x, y-oPlayer.vsp, oPlayer))
			{
				movingUp = true;
				if(oPlayer.vsp > 0){
					movingUp = false;
				}
			    while (!place_meeting(x, y - sign(oPlayer.vsp), oPlayer))
			    {
			        oPlayer.y += sign(oPlayer.vsp);
			    }
				if(movingUp){
					oPlayer.y += .1;
				}
				else{
					oPlayer.y -= .1;
				}
			    oPlayer.vsp = 0;
			}
		}
	}
}
else{
	collidingWithPlayer = false;
}