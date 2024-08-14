function send_movement_buffer(_target, _x, _y, _ang) {
	var _buff = buffer_create(15, buffer_fixed, 1); 
	buffer_write(_buff, buffer_u8, PACKET.REQ_MOVEMENT); 
	buffer_write(_buff, buffer_u64, steam_id); 
	buffer_write(_buff, buffer_u16, _x); 
	buffer_write(_buff, buffer_u16, _y); 
	buffer_write(_buff, buffer_f16, _ang); 
	steam_net_packet_send(_target, _buff); 
	buffer_delete(_buff); 
}