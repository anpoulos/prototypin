
event_inherited();

_selectedCell = undefined;

_cameraX = 0;
_cameraY = 0;

_mouseClickX = undefined;
_mouseClickY = undefined;
_originalCameraX = undefined;
_originalCameraY = undefined;

_zoom = 1;

_cameraMoveAmount = 30;

_applyZoom = function(){
	var cameraService = Get(CameraService);
	if(cameraService == undefined){
		return;	
	}
	
	_zoom = clamp(_zoom, 0.5, 2.0);
	
	var oldWidth = cameraService.GetWidth();
	var oldHeight = cameraService.GetHeight();
	
	cameraService.Zoom(_zoom);
	
	width = cameraService.GetWidth();
	height = cameraService.GetHeight();
	
	var wD = width - oldWidth;
	var hD = height - oldHeight;
	
	_cameraX -= wD/2;
	_cameraY -= hD/2	
}
