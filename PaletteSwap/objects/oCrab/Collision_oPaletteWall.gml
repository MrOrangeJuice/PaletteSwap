/// @description Insert description here
// You can write your code in this editor

//if stuck in palette block in non-blue palette, become dormant
if (!dormant && global.color != 1 && abs(CalculateCollisionOverlap(self, other)[0]) > 32) {
	
	dormant = true;
	SwapSprite(sSmolCrab);
	//if youre stuck and color becomes blue, reactivate
} else if (dormant && global.color == 1) {
	dormant = false;
	SwapSprite(sCrabNew);
	//enable collision forgiveness 
	forgiveness = true;
	alarm[0] = room_speed * 0.5;
}