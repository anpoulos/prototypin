
_xSpeed = 0;
_ySpeed = 0;
_gravity = 3;
_maxVelocity = 20;
_isFalling = false;
_overlappingObjects = ds_list_create();

function SetYSpeed(speed){
	_ySpeed = speed;	
}
function SetXSpeed(speed){
	_xSpeed = speed;
}
function SetSpeeds(xSpeed, ySpeed){
	_xSpeed = xSpeed;
	_ySpeed = ySpeed;
}
function IsFalling(){
	return _isFalling;
}

function IsObjectAncestor(object, ancestorIndex){
	var objectIndex = object.object_index;
	return objectIndex == ancestorIndex || object_is_ancestor(objectIndex, ancestorIndex);
}

_processPhysics = function(){
	_ySpeed = min(_ySpeed + _gravity, _maxVelocity);
	
	var futureX = x + _xSpeed;
	var futureY = y + _ySpeed;
	
	if(_xSpeed != 0){
		ds_list_clear(_overlappingObjects);
		var total = instance_place_list(futureX, y, NoFallThrough, _overlappingObjects, false);
		if(total > 0){
			var originalXSpeed = _xSpeed;
			while(total > 0){
				var hadCollision = false;
				for(var i = 0; i < total; i++){
					var object = _overlappingObjects[| i];
					if(object.image_angle != 0 || !IsObjectAncestor(object, NoFallThroughSquare)){
						continue;	
					}
					if(place_meeting(x + _xSpeed, y, object)){
						hadCollision = true;
						break;
					}
				}
				if(hadCollision){
					if(originalXSpeed > 0){
						_xSpeed -= 1;	
					}
					else{
						_xSpeed += 1;	
					}	
					futureX = x + _xSpeed;
					ds_list_clear(_overlappingObjects);
					total = instance_place_list(futureX, y, NoFallThrough, _overlappingObjects, false);
				}
				else{
					break;	
				}
			}
			futureX = x + _xSpeed;
		}
	}
	
	if(_ySpeed != 0 && place_meeting(futureX, futureY, NoFallThrough)){
		var m = _ySpeed;
		while(place_meeting(futureX, y + m, NoFallThrough)){
			if(_ySpeed > 0){
				m -= 1;
			}
			else{
				m += 1;	
			}
		}
		
		_ySpeed = 0;
		futureY = y + m;
	}
	
	y = futureY;
	x = futureX;
	
	_isFalling = !place_meeting(x, y + 2, NoFallThrough);
}
