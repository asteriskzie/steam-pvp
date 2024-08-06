/// @description Insert description here
// You can write your code in this editor

var _type = async_load[?"event_type"]; 

switch(_type) {
	case "lobby_chat_update": 
		// someone enters or leaves the lobby 
		if (async_load[? "change_flags"] & steam_lobby_member_change_entered) {
			
		} else if (async_load[? "change_flags"] & steam_lobby_member_change_left) {
			
		}
	
		break; 
}