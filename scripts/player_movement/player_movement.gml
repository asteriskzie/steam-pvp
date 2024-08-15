function request_shot() {
	var _buff = buffer_create(9, buffer_fixed, 1); 
	buffer_write(_buff, buffer_u8, PACKET.REQ_SHOT); 
	buffer_write(_buff, buffer_u64, steam_id); 
	var _host = steam_lobby_get_owner_id(); 
	steam_net_packet_send(_host, _buff); // TODO: get use id nya server (mungkin bs disimpen di variable)
	buffer_delete(_buff); 
}

function request_movement(_dx, _dy, _ang) {
	var _host = steam_lobby_get_owner_id(); 
	send_movement_buffer(_host, _dx, _dy, _ang); 
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
		request_movement(_dx, _dy, image_angle); 
	}
	
	if (action_key && !is_cooldown) {
		request_shot(); 	
		//spawn_bullet();
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