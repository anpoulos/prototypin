event_inherited();

draw_set_alpha(1.0);
draw_set_color(c_black);

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

//var leftX = _cameraX
//var rightX = _cameraX + width;
//var topY = _cameraY;
//var bottomY = _cameraY + height;

//var totalColumns = roomService.GetTotalColumns();
//var totalRows = roomService.GetTotalRows();

//var leftCell = roomService.GetRoomCellAt(leftX, 0);
//var righCell = roomService.GetRoomCellAt(rightX, 0);
//var topCell = roomService.GetRoomCellAt(0, topY);
//var bottomCell = roomService.GetRoomCellAt(0, bottomY);

//var grid = roomService.GetRoomGrid();
//var startingColumn = 0;
//if(leftCell != undefined){
//	startingColumn = max(0, leftCell.ColumnIndex - 1);	
//}

//var endingColumn = totalColumns;
//if(righCell != undefined){
//	endingColumn = min(righCell.ColumnIndex + 1, totalColumns);	
//}

//var startingRow = 0;
//if(topCell != undefined){
//	startingRow = max(0, topCell.RowIndex - 1);	
//}

//var endingRow = totalRows;
//if(bottomCell != undefined){
//	endingRow = min(bottomCell.RowIndex + 1, totalRows);
//}

//draw_set_color(c_black);
//for(var i = startingColumn; i < endingColumn; i++){
//	for(var j = startingRow; j < endingRow; j++){
//		var roomCell = grid[# i, j];
//		roomCell.Draw();
//	}
//}

if(_selectedCell != undefined){
	_selectedCell.Draw();	
}

//left
draw_rectangle(-width, -height, 0, room_height + 1, false);

//top
draw_rectangle(-width, -height, room_width + width, 0, false);

//right
draw_rectangle(room_width, -height, room_width + width, room_height + height, false);

//bottom
draw_rectangle(-width, room_height, room_width + width, room_height + height, false);