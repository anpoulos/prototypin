
function enemy_functions(){
	function getLockedTarget(){
		var player = Get(obj_player);
		
		if(abs(x - player.x) < 1000){
			return player;
		}
		
		return undefined;
	}
	
	function enemy_state_idle(){
		image_alpha = 1.0;
		xSpeed = 0;
		
		lockedTarget = getLockedTarget();
		
		if(lockedTarget != undefined){
			state = enemy_state_chase;
			lifeform_change_sprite(spr_player_run);
		}
	}
	
	function enemy_state_chase(){
		var distance = point_distance(lockedTarget.x, lockedTarget.y, x, y);
		
		if(distance <= 200){
			if(x < lockedTarget.x){
				image_xscale = abs(image_xscale);	
			}
			else{
				image_xscale = -abs(image_xscale);
			}
			
			if(irandom(100) > 75){
				lifeform_change_sprite(spr_player_attack);
				state = enemy_state_attack;	
			}
			else{
				enemy_initialize_dodge();
			}
		}
		else if(distance > 1000){
			lifeform_change_sprite(spr_player_idle);
			state = enemy_state_idle;
		}
		else{
			if(x < lockedTarget.x){
				xSpeed = runSpeed;
			}
			else{
				xSpeed = -runSpeed;	
			}
		}
	}
	
	function enemy_state_dodge(){
		isDodging = true;
		image_alpha = 0.5;
		dodgeTimer -= 1;
		if(dodgeTimer <= 0){
			state = enemy_state_idle;	
			lifeform_change_sprite(spr_player_idle);	
		}
	}
	
	function enemy_initialize_dodge(){
		lifeform_change_sprite(spr_player_idle);
		state = enemy_state_dodge;	
		dodgeTimer = 4;
		xSpeed = sign(image_xscale) * 40;
	}
	
	function enemy_state_attack(){
		if(isFalling){
			//later on maybe stuff?
		}
		else{
			xSpeed = 0;
			var frame = round(image_index);
			var moveSpeed = 0;
			
			if(frame == 2){
				moveSpeed = 6;
			}
			else if(frame == 3){
				moveSpeed = 2;
			}
			else if(frame == 4){
				moveSpeed = 2;
				var face = sign(image_xscale);
				var distance = point_distance(lockedTarget.x, lockedTarget.y, x, y);
				if(distance > 100){
					moveSpeed = 15;
				}
				
				var myId = id;
				var topBound = y - 95*2;
				var bottomBound = y + 64;
				if(face == LEFT){
					var leftBound = x - 92*2;
					var rightBound = x + 100;
				}
				else{
					var rightBound = x + 92*2;
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
				if(irandom(100) > 75){
					enemy_initialize_dodge();
					return;
				}
			}
			
			if(moveSpeed != 0){
				xSpeed = sign(image_xscale) * moveSpeed;
			}
		}	
	}
}