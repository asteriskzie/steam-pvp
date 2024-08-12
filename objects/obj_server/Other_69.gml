/// @description Insert description here
// You can write your code in this editor

function send_init_config(_target_id) {
	var _packet = []
	
	for (var _i = 0; _i < array_length(player_list); _i++) {
		var _player = player_list[_i].character; 
		array_push(_packet, {
			steam_id: _player.steam_id, 
			x: _player.x, 
			y: _player.y, 
			image_angle: _player.image_angle,
			hp: _player.hp,			
		}); 
	}
	
	show_debug_message("otw bikin buffer dari server"); 
	var _buff = buffer_create(1, buffer_grow, 1); 
	buffer_write(_buff, buffer_u8, PACKET.INIT_CONFIG); 
	buffer_write(_buff, buffer_string, json_stringify(_packet)); 
	steam_net_packet_send(_target_id, _buff); 
	buffer_delete(_buff); 
}

var _type = async_load[?"event_type"]; 

switch(_type) {
	case "lobby_chat_update": 
		var _from_id = async_load[?"user_id"]; //SteamID
		var _from_name = steam_get_user_persona_name_sync(_from_id); //Steam Player Name
		
		// someone enters or leaves the lobby 
		if (async_load[? "change_flags"] & steam_lobby_member_change_entered) {
			show_debug_message("Player Joined: " + _from_name); 			
			insert_player(_from_id); 
			spawn_player(_from_id); 
			
			send_init_config(_from_id); 
					
		} else if (async_load[? "change_flags"] & steam_lobby_member_change_left) {
			show_debug_message("Player Left: " + _from_name); 
			erase_player(_from_id); 		
		}
	
		break; 
}

