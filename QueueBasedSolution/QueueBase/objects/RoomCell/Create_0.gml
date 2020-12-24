event_inherited();

Selected = false;
_leftX = undefined;
_rightX = undefined;
_bottomY = undefined;
_topY = undefined;

ColumnIndex = 0;
RowIndex = 0;

Initialize = function(columnIndex, rowIndex){
	_leftX = columnIndex * 64;
	_rightX = _leftX + 64;
	_topY = rowIndex * 64;
	_bottomY = _topY + 64;
	
	ColumnIndex = columnIndex;
	RowIndex = rowIndex;
}

Draw = function(){
	if(!Selected){
		return;	
	}
	//draw_set_halign(fa_middle);
	//draw_set_valign(fa_center);
	//draw_set_font(RoomCellFont);
	//draw_text(
	//	_leftX + 32,
	//	_topY + 32,
	//	"c: " + string(ColumnIndex) + ", r: " + string(RowIndex));
	draw_rectangle(_leftX + 1, _topY + 1, _rightX - 1, _bottomY - 1, true);
}