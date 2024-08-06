// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_movement(){
	x += (right_key - left_key) * move_speed; 
	y += (down_key - up_key) * move_speed; 
	
	image_angle = point_direction(x, y, mouse_x, mouse_y); 
	
	if (action_key && !is_cooldown) {
		var _bullet = instance_create_layer(x, y, "Instances", obj_projectile);
		_bullet.direction = image_angle; 
		is_cooldown = true; 
		alarm[0] = 30; 
	}
}