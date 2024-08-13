/// @description Insert description here
// You can write your code in this editor

while(steam_net_packet_receive()) {	
	var _sender = steam_net_packet_get_sender_id();
	
	steam_net_packet_get_data(inbuf);	
	buffer_seek(inbuf, buffer_seek_start, 0); 
	var _type = buffer_read(inbuf, buffer_u8); 
	
	switch(_type) {
		case PACKET.INIT_CONFIG: 
			// salin playerlist, perlu posisi tiap character 
			// sama ID masing" 
			var _json = buffer_read(inbuf, buffer_string); 
			var _player_init_list = json_parse(_json); 
			
			for (var _i = 0; _i < array_length(_player_init_list); _i++) {				
				var _player = _player_init_list[_i]; 
				
				insert_player(_player.steam_id); 
				spawn_player(_player.steam_id); 
				
				var _player_obj = player_list[_i].character; 
				_player_obj.x = _player.x; 
				_player_obj.y = _player.y; 
				_player_obj.image_angle = _player.image_angle;
				_player_obj.hp = _player.hp; 				
			}
			
			break; 
			
		case PACKET.MOVE_PLAYER: 
			var _steam_id = buffer_read(inbuf, buffer_u64); 
			var _x = buffer_read(inbuf, buffer_u8); 
			var _y = buffer_read(inbuf, buffer_u8); 
			var _image_angle = buffer_read(inbuf, buffer_u8); 
			
			var _idx = get_list_idx(_steam_id);
			var _player_obj = player_list[_idx].character; 
			_player_obj.x = _x; 
			_player_obj.y = _y; 
			_player_obj.image_angle = _image_angle; 
			
			break; 
			
		case PACKET.DO_SHOT: 
			var _steam_id = buffer_read(inbuf, buffer_u64); 
			var _idx = get_list_idx(_steam_id);
			var _player_obj = player_list[_idx].character;
			
			with(_player_obj) {
				spawn_bullet(); 	
			}
			
			break; 

		default: 
			show_debug_message("Unrecognized packet: " + string(_type)); 
	}
}