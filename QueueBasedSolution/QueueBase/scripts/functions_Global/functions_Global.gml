
function Create(objectIndex){
	return instance_create_depth(0,0,0, objectIndex);	
}

function Get(objectIndex){
	var obj = instance_find(objectIndex, 0);
	return obj == noone ? undefined : obj;
}

function GetAndDestroy(objectIndex){
	var obj = Get(objectIndex);
	if(obj != undefined && instance_exists(obj)){
		instance_destroy(obj);	
	}
}

function CreateAllServicesAndControllers(){
	Create(RoomService);
	
	Create(CameraController);
	Create(CameraService);
	
	Create(InputController);
	
	
	var roomService = Get(RoomService);
	roomService.LoadRoom(Room1);
}

function ScheduleFunction(duration, func){
	var obj = Create(ScheduledFunction);
	obj.Initialize(duration, func);
	return obj;
}

function ScheduleStepFunction(steps, func){
	var obj = Create(ScheduledFunction);
	obj.InitializeStep(steps, func);
	return obj;
}

function ConsoleWrite(msg){
	show_debug_message(string(msg));	
}

function ConsoleWriteTime(){
	ConsoleWrite(current_time);	
}

function GetGuiWidthByPercent(percent) {
	return round(display_get_gui_width() * (percent / 100));
}
function GetGuiHeightByPercent(percent) {
	return round(display_get_gui_height() * (percent / 100));
}
