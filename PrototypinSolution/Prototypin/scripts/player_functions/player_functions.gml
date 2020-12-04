
function player_functions(){

	function player_state_idle(){
		image_alpha = 1.0;
		xSpeed = 0;	
		
		if(keyboard_check(ord("D"))){
			xSpeed = runSpeed;
			state = player_state_run;
			lifeform_change_sprite(spr_player_run);
		}
		else if(keyboard_check(ord("A"))){
			xSpeed = -runSpeed;
			state = player_state_run;
			lifeform_change_sprite(spr_player_run);
		}
		else{
			xSpeed = 0;	
		}

		if(keyboard_check_pressed(vk_space)){
			player_initialize_jump_in();
		}
		
		if(mouse_check_button(mb_left)){
			lifeform_change_sprite(spr_player_attack);
			state = player_state_attack;	
		}
		
		if(keyboard_check_pressed(vk_lshift)){
			player_initialize_dodge();
		}
		
		if(isFalling){
			state = player_state_jump;	
			lifeform_change_sprite(spr_player_jump_idle);
		}
	}
	
	function player_state_dodge(){
		isDodging = true;
		image_alpha = 0.5;
		dodgeTimer -= 1;
		if(dodgeTimer <= 0){
			state = player_state_idle;	
			lifeform_change_sprite(spr_player_idle);	
		}
	}
	
	function player_initialize_dodge(){
		lifeform_change_sprite(spr_player_idle);
		state = player_state_dodge;	
		dodgeTimer = 4;
		xSpeed = sign(image_xscale) * 40;
	}
	
	function player_state_attack(){
		if(isFalling){
			//later on maybe stuff?
		}
		else{
			xSpeed = 0;
			var frame = round(image_index);
			var moveSpeed = 0;
			
			if(frame < 4){
				if(keyboard_check(ord("D"))){
					image_xscale = abs(image_xscale);
				}
				else if(keyboard_check(ord("A"))){
					image_xscale = -abs(image_xscale);
				}	
			}
			
			if(frame == 2){
				moveSpeed = 6;
			}
			else if(frame == 3){
				moveSpeed = 2;
			}
			else if(frame == 4){
				moveSpeed = 2;
				var face = sign(image_xscale);
				if(
					(face == 1 && keyboard_check(ord("D"))) || 
					(face == -1 && keyboard_check(ord("A")))
				){
					moveSpeed = 15;
				}
				
				var myId = id;
				var topBound = y - 95*2;
				var bottomBound = y + 64;
				if(face == LEFT){
					var leftBound = x - 115*2;
					var rightBound = x + 100;
				}
				else{
					var rightBound = x + 115*2;
					var leftBound = x - 100;
				}
				
				var hitbox = undefined;
				with(obj_hitbox_parent){
					if(
						(owner != undefined && owner.id == myId) ||
						flashTimer > 0
					){
						continue;
					}
					
					if(owner != undefined && owner.isDodging){
						continue;
					}
					
					if(rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, leftBound, topBound, rightBound, bottomBound) > 0){
						hitbox = id;
					}
				}
				
				if(hitbox != undefined){
					hitbox.flashTimer = 10;
				}				
			}
			else if(frame >= 5){
				if(keyboard_check_pressed(vk_lshift)){
					player_initialize_dodge();
					return;
				}
			}
			
			if(moveSpeed != 0){
				xSpeed = sign(image_xscale) * moveSpeed;
			}
		}
	}
	
	function player_initialize_jump_in(){
		ySpeed = jumpSpeed;
		state = player_state_jump_in;
		animationEndCheckTimer = 2;	
		lifeform_change_sprite(spr_player_jump_in);
	}
	
	function player_state_run(){		
		if(keyboard_check(ord("D"))){
			xSpeed = runSpeed;
		}
		else if(keyboard_check(ord("A"))){
			xSpeed = -runSpeed;
		}
		else{
			xSpeed = 0;
			state = player_state_idle;
			lifeform_change_sprite(spr_player_idle);
		}		
		
		if(keyboard_check_pressed(vk_space)){
			player_initialize_jump_in();
		}
		
		if(mouse_check_button(mb_left)){
			lifeform_change_sprite(spr_player_attack);
			state = player_state_attack;	
		}
		
		if(keyboard_check_pressed(vk_lshift)){
			player_initialize_dodge();
		}
	}
	
	function player_state_jump(){		
		if(mouse_check_button(mb_left)){
			lifeform_change_sprite(spr_player_attack);
			state = player_state_attack;	
		}
		
		if(keyboard_check(ord("D"))){
			xSpeed = runSpeed;
		}
		else if(keyboard_check(ord("A"))){
			xSpeed = -runSpeed;
		}
		else{
			xSpeed = 0;
		}		
		
		if(!isFalling){
			state = player_state_idle;	
			lifeform_change_sprite(spr_player_idle);
		}
	}
	
	function player_state_jump_in(){	
		if(mouse_check_button(mb_left)){
			lifeform_change_sprite(spr_player_attack);
			state = player_state_attack;	
		}
		
		if(keyboard_check(ord("D"))){
			xSpeed = runSpeed;
		}
		else if(keyboard_check(ord("A"))){
			xSpeed = -runSpeed;
		}
		else{
			xSpeed = 0;
		}		
		
		if(!isFalling){
			state = player_state_idle;	
			lifeform_change_sprite(spr_player_idle);
		}	
	}
}
