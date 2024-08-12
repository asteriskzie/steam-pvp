/// @description Insert description here
// You can write your code in this editor

while(steam_net_packet_receive()) {	
	var _sender = steam_net_packet_get_sender_id();
	
	steam_net_packet_get_data(inbuf);	
	buffer_seek(inbuf, buffer_seek_start, 0); 
	var _type = buffer_read(inbuf, buffer_u8); 
	
	switch(_type) {
			
		case PACKET.REQ_SHOT: 
			var _steam_id = buffer_read(inbuff, buffer_u16);
			
			var _idx = get_list_idx(_steam_id); 
			var _player = player_list[_idx].character; 
			with (_player) {
				spawn_bullet();
			}			
			
			break;

		default: 
			show_debug_message("Unrecognized packet: " + string(_type)); 
	}
}