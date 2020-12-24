event_inherited();

_defaultWidth = 1920;
_defaultHeight = 1080;

_width = _defaultWidth;
_height = _defaultHeight;

_camera = camera_create_view(0, 0, 0, 0, 0, -1, -1, -1, 4000, 4000);

_loadView = function(){
	view_enabled = true;
	view_camera[0] = _camera
}

GetWidth = function(){
	return _width;	
}

GetHeight = function(){
	return _height;	
}

_setView = function(gmsRoomIndex, width, height){
	_width = width;
	_height = height;
	room_set_viewport(gmsRoomIndex, 0, true, 0, 0, width, height);
	camera_set_view_size(_camera, width, height);
}

LoadCameraForRoom = function(gmsRoomIndex){
	room_set_camera(gmsRoomIndex, 0, 0);
	_setView(gmsRoomIndex, _defaultWidth, _defaultHeight);
	ScheduleStepFunction(1, _loadView);
}

GetCamera = function(){
	return _camera;	
}

Zoom = function(amount){
	var ratio = _defaultHeight / _defaultWidth;
	var newWidth = _defaultWidth*amount;
	var newHeight = newWidth * ratio;
	_setView(room, newWidth, newHeight);	
}


