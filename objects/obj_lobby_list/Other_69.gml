/// @description Insert description here
// You can write your code in this editor

var _type = async_load[?"event_type"]; 

switch(_type) {
	case "lobby_list" : 
		reset_lobby_list(); 
		
		if (steam_lobby_list_get_count() == 0) {
			// no lobby yet 
			lobby_list[0] = instance_create_depth(x, bbox_top+40, -20, obj_lobby_item); 
		} else {
			for (var _i = 0; _i < steam_lobby_list_get_count(); _i++) {
				var _inst = instance_create_depth(x, bbox_top+40+80*_i, -20, obj_lobby_item, {
					lobby_index		: _i, 
					lobby_id		: steam_lobby_list_get_lobby_id(_i), 
					lobby_creator	: steam_lobby_list_get_data(_i, "Creator")
				}); 
				array_push(lobby_list, _inst); 
			}
		}
}