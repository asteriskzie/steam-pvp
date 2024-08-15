function send_req_move_buffer(_target, _dx, _dy, _ang) {
	send_move_buffer(PACKET.REQ_MOVE, _target, _dx, _dy, _ang); 
}

function send_do_move_buffer(_target, _dx, _dy, _ang) {
	send_move_buffer(PACKET.DO_MOVE, _target, _dx, _dy, _ang); 
}

function send_move_buffer(_packet, _target, _dx, _dy, _ang) {
	var _buff = buffer_create(13, buffer_fixed, 1); 
	buffer_write(_buff, buffer_u8, _packet); 
	buffer_write(_buff, buffer_u64, steam_id); 
	buffer_write(_buff, buffer_s8, _dx); 
	buffer_write(_buff, buffer_s8, _dy); 
	buffer_write(_buff, buffer_f16, _ang); 
	steam_net_packet_send(_target, _buff); 
	buffer_delete(_buff); 
}