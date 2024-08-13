function request_shot() {
	var _buff = buffer_create(9, buffer_fixed, 1); 
	buffer_write(_buff, buffer_u8, PACKET.REQ_SHOT); 
	buffer_write(_buff, buffer_u64, steam_id); 
	var _host = steam_lobby_get_owner_id(); 
	steam_net_packet_send(_host, _buff); // TODO: get use id nya server 
	buffer_delete(_buff); 
}

///@self obj_player
function player_movement(){
	x += (right_key - left_key) * move_speed; 
	y += (down_key - up_key) * move_speed; 
	
	image_angle = point_direction(x, y, mouse_x, mouse_y); 
	
	if (action_key && !is_cooldown) {
		request_shot(); 	
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