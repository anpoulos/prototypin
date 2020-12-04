
//surfaceObjectType can be a instance or a object type
//returns a point object of where the object should be according to the bounds of the surface
//NOTE: the point returned is when no collisions register, so it will be outside of whatever is being checked for
//if deliverPayload is set to true, collided with object will be returned as point's payload
//returns undefined if no collision
function GetContinousPhysicsPoint(originX, originY, newX, newY, surfaceObjectType, preciseChecks, deliverPayload){
	
	if(surfaceObjectType == undefined){
		return undefined;	
	}
	
	var surface = collision_line(originX, originY, newX, newY, surfaceObjectType, preciseChecks, true);
	
	if(surface != noone){
		var angle = point_direction(originX, originY, newX, newY);
		var distance = point_distance(originX, originY, newX, newY);
		
		var previousSurface = undefined;
		
		while(surface != noone && distance > 0){		
			distance -= 1;
			
			var checkX = originX + dcos(angle) * distance;
			var checkY = originY - dsin(angle) * distance;
			
			previousSurface = surface;
			surface = collision_line(originX, originY, checkX, checkY, surfaceObjectType, preciseChecks, true);
			if(surface == noone){
				var point = Create(Point);
				if(deliverPayload){
					point.Payload = previousSurface;
				}
				
				return point;			
			}
		}
	}
	
	return undefined;
}