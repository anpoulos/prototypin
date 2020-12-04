event_inherited();

SetXSpeed(0);

var s = 15;
if(keyboard_check(ord("A")) || keyboard_check(ord("D"))){
	if(keyboard_check(ord("A"))){
		SetXSpeed(-s);
	}
	else{
		SetXSpeed(s);
	}
}

if(keyboard_check(ord("W"))){
	SetYSpeed(-25);
}
