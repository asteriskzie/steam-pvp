function send_req_move_buffer(_target, _dx, _dy, _ang) {
	var _buff = buffer_create(5, buffer_fixed, 1); 
	buffer_write(_buff, buffer_u8, PACKET.REQ_MOVE); 	
	buffer_write(_buff, buffer_s8, _dx); 
	buffer_write(_buff, buffer_s8, _dy); 
	buffer_write(_buff, buffer_f16, _ang); 
	steam_net_packet_send(_target, _buff); 
	buffer_delete(_buff); 
}

function send_do_move_buffer(_target, _dx, _dy, _ang) {
	var _buff = buffer_create(13, buffer_fixed, 1); 
	buffer_write(_buff, buffer_u8, PACKET.DO_MOVE); 
	buffer_write(_buff, buffer_u64, steam_id); 
	buffer_write(_buff, buffer_s8, _dx); 
	buffer_write(_buff, buffer_s8, _dy); 
	buffer_write(_buff, buffer_f16, _ang); 
	steam_net_packet_send(_target, _buff); 
	buffer_delete(_buff); 
}

function send_req_shot_buffer(_target) {
	var _buff = buffer_create(1, buffer_fixed, 1); 
	buffer_write(_buff, buffer_u8, PACKET.REQ_SHOT);  
	steam_net_packet_send(_target, _buff);
	buffer_delete(_buff); 
}

function send_do_shot_buffer(_target, _shooter) {
	var _buff = buffer_create(9, buffer_fixed, 1); 
	buffer_write(_buff, buffer_u8, PACKET.DO_SHOT);
	buffer_write(_buff, buffer_u64, _shooter);  
	steam_net_packet_send(_target, _buff);
	buffer_delete(_buff); 
}

function send_spawn_player(_target, _player) {
	// TODO: ini belum ditest
	var _buff = buffer_create(9, buffer_fixed, 1);
	buffer_write(_buff, buffer_u8, PACKET.SPAWN_PLAYER);
	buffer_write(_buff, buffer_u64, _player.steam_id); // TODO: might need to refactor	
	steam_net_packet_send(_target, _buff);
	buffer_delete(_buff); 
}

function send_spawn_enemy(_target, _x) {
	var _buff = buffer_create(3, buffer_fixed, 1);
	buffer_write(_buff, buffer_u8, PACKET.SPAWN_ENEMY);
	buffer_write(_buff, buffer_u16, _x); 
	steam_net_packet_send(_target, _buff);
	buffer_delete(_buff); 
}