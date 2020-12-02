
event_inherited();
player_functions();

hitbox = instance_create_depth(x, y, depth, obj_player_hitbox);
hitbox.owner = id;

state = player_state_idle;

image_xscale = 2;
image_yscale = 2;

animationEndCheckTimer = -1;

dodgeTimer = -1;