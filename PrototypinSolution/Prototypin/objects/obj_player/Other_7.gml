
if(animationEndCheckTimer > 0){
	return;	
}

switch(state){
	case player_state_jump_in:
		state = player_state_jump;	
		lifeform_change_sprite(spr_player_jump_idle);
	break;
	
	case player_state_attack:
		state = player_state_idle;	
		lifeform_change_sprite(spr_player_idle);
	break;
}

