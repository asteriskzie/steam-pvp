/// @description Insert description here
// You can write your code in this editor

function broadcast_do_shot(_exclude, _shooter) {
	// broadcast ke semua kecuali yang diexclude 
	for (var _i = 0; _i < array_length(player_list); _i++) {
		if(!array_contains(_exclude, player_list[_i].steam_id)){
			show_debug_message("[DEBUG] sending shot buffer to " + steam_get_user_persona_name_sync(player_list[_i].steam_id)); 
			send_do_shot_buffer(player_list[_i].steam_id, _shooter); 
		} 
	}
}

function broadcast_do_movement(_exclude, _dx, _dy, _ang) {
	// broadcast ke semua kecuali yang diexclude 
	for (var _i = 0; _i < array_length(player_list); _i++) {
		if(!array_contains(_exclude, player_list[_i].steam_id)){
			show_debug_message("[DEBUG] sending movement buffer to " + steam_get_user_persona_name_sync(player_list[_i].steam_id)); 
			send_do_move_buffer(player_list[_i].steam_id, _dx, _dy, _ang); 
		} 
	}
}

while(steam_net_packet_receive()) {	
	var _sender_id = steam_net_packet_get_sender_id();
	
	steam_net_packet_get_data(inbuf);	
	buffer_seek(inbuf, buffer_seek_start, 0); 
	var _type = buffer_read(inbuf, buffer_u8); 
	
	switch(_type) {
		case PACKET.REQ_SHOT: 
		{
			var _shooter_id = _sender_id; 
			var _player_obj = get_player_obj_from_id(_shooter_id);
			
			with(_player_obj) { 
				spawn_bullet(); 
			}
			
			broadcast_do_shot([steam_id], _shooter_id);
			
			break; 
		}
		case PACKET.REQ_MOVE: 
		{
			var _player_obj = get_player_obj_from_id(_sender_id); 			
			var _dx = buffer_read(inbuf, buffer_s8); 
			var _dy = buffer_read(inbuf, buffer_s8); 
			var _ang = buffer_read(inbuf, buffer_f16); 
			
			_player_obj.x += _dx; 
			_player_obj.y += _dy; 
			_player_obj.image_angle = _ang; 
			
			broadcast_do_movement([_sender_id, steam_id], _dx, _dy, _ang); 
			
			break; 
		}
		default: 
			show_debug_message("Unrecognized packet: " + string(_type)); 
	}
}