function request_shot() {	
	var _host = steam_lobby_get_owner_id();
	send_req_shot_buffer(_host);
}

function request_movement(_x, _y, _ang) {
	var _host = steam_lobby_get_owner_id(); 
	send_req_move_buffer(_host, _x, _y, _ang); 
}

///@self obj_player
function player_movement(){
	var _dx = (right_key - left_key) * move_speed; 
	var _dy = (down_key - up_key) * move_speed; 
	var _dang = angle_difference(point_direction(x, y, mouse_x, mouse_y), image_angle); 
	
	if (_dx != 0 || _dy != 0 || _dang > 1 || _dang < -1) {		
		x += _dx; 
		y += _dy; 
		image_angle = point_direction(x, y, mouse_x, mouse_y); 
		request_movement(x, y, image_angle); 
	}
	
	if (action_key && !is_cooldown) {
		request_shot(); 	
		//spawn_bullet(); // TODO: after everything works fine, uncomment this
	}	
}

///@self obj_player 
function spawn_bullet() {
	var _bullet = instance_create_layer(x, y, "Instances", obj_projectile);
	_bullet.direction = image_angle;
	_bullet.owner = steam_id; 
	is_cooldown = true; 
	alarm[0] = 30; 
}