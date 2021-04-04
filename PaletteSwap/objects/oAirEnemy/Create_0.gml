/// @description Initialize Enemy Params

enum flyingType {
   hover = 0,
   seek = 1,
   backAndForth = 2
   }

x1 = x;
y1 = y;
x2 = x + (dcos(degDir) * travelDistance);
y2 = y + (dsin(degDir) * travelDistance);