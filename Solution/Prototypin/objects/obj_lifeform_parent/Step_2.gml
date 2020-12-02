
isFalling = true;

var possibleX = x + xSpeed;

if(xSpeed != 0){
	var goingRight = xSpeed > 0;
	var horizontalSurface = collision_point(possibleX, y, obj_no_fall_through, true, false);
	while(horizontalSurface != noone){
		if(goingRight){
			xSpeed -= 1;	
		}
		else{
			xSpeed += 1;
		}
			
		possibleX = x + xSpeed;
			
		horizontalSurface = collision_point(possibleX, y, obj_no_fall_through, true, false);
	}
}

x = possibleX;

ySpeed += GRAVITY;
if(ySpeed > MAX_VELOCITY){
	ySpeed = MAX_VELOCITY;	
}

var possibleY = y + ySpeed;

var goingDown = ySpeed > 0;
var verticalSurface = collision_point(x, possibleY, obj_no_fall_through, true, false);
while(verticalSurface != noone){
	if(goingDown){
		ySpeed = 0;
		y = verticalSurface.bbox_top - 1;
		possibleY = y;
		isFalling = false;
		break;
	}
	else{
		ySpeed += 1;
	}
	
	verticalSurface = collision_point(x, possibleY, obj_no_fall_through, true, false);
}

y = possibleY;

if(xSpeed > 0){
	image_xscale = abs(image_xscale);
}
else if(xSpeed < 0){
	image_xscale = -abs(image_xscale);
}
