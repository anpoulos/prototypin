
event_inherited();

if(!_initialized){
	return;	
}

if(_timer != undefined && current_time - _timer >= _duration){
	_function();
	Destroy();
}

if(_steps != undefined){
	_steps -= 1;
	if(_steps <= 0){
		_function();
		Destroy();
	}
}