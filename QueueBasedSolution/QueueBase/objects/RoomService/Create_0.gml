event_inherited();

_roomGrid = undefined;
_cellDimension = 64;
_columns = 1;
_rows = 1;

_loadRoomGrid = function(){
	_destroyRoomGrid();
	_columns = ceil(room_width / _cellDimension);
	_rows = ceil(room_height / _cellDimension);
	_roomGrid = ds_grid_create(_columns, _rows);
	for(var i = 0; i < _columns; i++){
		for(var j = 0; j < _rows; j++){
			var roomCell = Create(RoomCell);
			roomCell.Initialize(i, j);
			_roomGrid[# i, j] = roomCell;			
		}
	}
}

GetRoomCellAt = function(x, y){
	var column = floor(x/64);
	var row = floor(y/64);
	if(
		column < 0 ||
		row < 0 ||
		column >= _columns || 
		row >= _rows || 
		_roomGrid == undefined
	){
		return undefined;	
	}
	return _roomGrid[# column, row];
}

GetRoomGrid = function(){
	return _roomGrid;	
}

_destroyRoomGrid = function(){
	if(_roomGrid == undefined){
		return;
	}
	
	ds_grid_destroy(_roomGrid);	
}

GetTotalColumns = function(){
	return _columns;	
}

GetTotalRows = function(){
	return _rows;	
}

LoadRoom = function(gmsRoomIndex){
	room_goto(gmsRoomIndex);
	
	var cameraService = Get(CameraService);
	cameraService.LoadCameraForRoom(gmsRoomIndex);
	
	ScheduleStepFunction(1, _loadRoomGrid);
}

