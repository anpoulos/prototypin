
#macro GRAVITY 2
#macro MAX_VELOCITY 20

function Create(objectIndex){
	return instance_create_depth(0,0,0, objectIndex);	
}

function GetPointString(x,y){
	return string(x) + ", " + string(y);	
}

function PrintPoint(x, y){
	show_debug_message(GetPointString(x,y));	
}

function PrintPoints(x1, y1, x2, y2){
	show_debug_message("x1,y1: " + GetPointString(x1,y1) + " | x2,y2: " + GetPointString(x2,y2));	
}

function IsObjectAncestor(object, ancestorIndex){
	var objectIndex = object.object_index;
	return objectIndex == ancestorIndex || object_is_ancestor(objectIndex, ancestorIndex);
}