
event_inherited();
enemy_functions();

hitbox = instance_create_depth(x, y, depth, obj_player_hitbox);
hitbox.owner = id;

state = enemy_state_idle;

image_xscale = 2;
image_yscale = 2;

animationEndCheckTimer = -1;

dodgeTimer = -1;

originalImageBlend = c_blue;
image_blend = c_blue;

lockedTarget = undefined;
