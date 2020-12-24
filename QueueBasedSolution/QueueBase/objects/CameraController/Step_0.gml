
var cameraService = Get(CameraService);
var roomService = Get(RoomService);
if(
	cameraService == undefined || 
	roomService == undefined	
){
	return;	
}

var width = cameraService.GetWidth();
var height = cameraService.GetHeight();

if(keyboard_check(ord("D"))){
	_cameraX += _cameraMoveAmount*_zoom;	
}
if(keyboard_check(ord("A"))){
	_cameraX -= _cameraMoveAmount*_zoom;	
}
if(keyboard_check(ord("S"))){
	_cameraY += _cameraMoveAmount*_zoom;	
}
if(keyboard_check(ord("W"))){
	_cameraY -= _cameraMoveAmount*_zoom;
}

if(mouse_wheel_down()){
	_zoom += 0.1;
	_applyZoom();
}
else if (mouse_wheel_up()){
	_zoom -= 0.1;	
	_applyZoom();
}

if(_selectedCell != undefined){
	_selectedCell.Selected = false;
	_selectedCell = undefined;
}

var mouseWorldX = window_views_mouse_get_x();
var mouseWorldY = window_views_mouse_get_y();
var roomCell = roomService.GetRoomCellAt(mouseWorldX, mouseWorldY);
if(roomCell != undefined){
	_selectedCell = roomCell;
	roomCell.Selected = true;
}

if(mouse_check_button(mb_right)){
	if(_mouseClickX == undefined){
		//_mouseClickX = window_mouse_get_x();
		//_mouseClickY = window_mouse_get_y();
		_mouseClickX = device_mouse_x_to_gui(0);
		_mouseClickY = device_mouse_y_to_gui(0);
		_originalCameraX = _cameraX;
		_originalCameraY = _cameraY;
	}
	else{
		var mouseX = device_mouse_x_to_gui(0);
		var mouseY = device_mouse_y_to_gui(0);
		
		var xDelta = _mouseClickX - mouseX;
		var yDelta = _mouseClickY - mouseY;
		
		_cameraX = _originalCameraX + (xDelta*_zoom);
		_cameraY = _originalCameraY + (yDelta*_zoom);
		//get deltas at time of first click
		//move camera to wherever mouse is and subtract old deltas
	}
}
else if(_mouseClickX != undefined){
	_mouseClickX = undefined;	
}

var wH = width / 2;
var hH = height / 2;

_cameraX = clamp(_cameraX, -wH, room_width - wH);
_cameraY = clamp(_cameraY, -hH, room_height - hH);

var camera = cameraService.GetCamera();
camera_set_view_pos(camera, _cameraX, _cameraY);

