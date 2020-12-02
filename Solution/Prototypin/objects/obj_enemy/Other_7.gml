
if(animationEndCheckTimer > 0){
	return;	
}

switch(state){
	case enemy_state_attack:
		state = enemy_state_idle;	
		lifeform_change_sprite(spr_player_idle);
	break;
}
