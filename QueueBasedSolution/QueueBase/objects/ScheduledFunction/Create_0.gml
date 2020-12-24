event_inherited();

_steps = undefined;

_timer = undefined;
_duration = undefined;
_initialized = false;

_function = undefined;

Initialize = function(duration, func){
	_duration = duration;
	_function = func;	
	_timer = current_time;
	_initialized = true;
}

InitializeStep = function(steps, func){
	_steps = steps;
	_function = func;
	_initialized = true;
}
