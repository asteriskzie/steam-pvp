/// @description Insert description here
// You can write your code in this editor
while(steam_net_packet_receive()) {	
	var _sender = steam_net_packet_get_sender_id();
	
	steam_net_packet_get_data(inbuf);	
	buffer_seek(inbuf, buffer_seek_start, 0); 
	var _type = buffer_read(inbuf, buffer_u8); 
	
	switch(_type) {
		case PACKET.REQ_SHOT: 
			var _shooter_id = buffer_read(inbuf, buffer_u64); 
			
			// DEBUG 
			var _shooter_name = steam_get_user_persona_name_sync(_shooter_id); 
			show_debug_message("Got shot request from " + _shooter_name); 
			// EOD
			
			var _player_obj = get_player_obj_from_id(_shooter_id);
			
			with(_player_obj) {
				spawn_bullet(); 
			}
			
			break; 
			
		default: 
			show_debug_message("Unrecognized packet: " + string(_type)); 
	}
}