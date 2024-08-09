function insert_player(_new_id) {
	var _found = false; 
	var _new_name = steam_get_user_persona_name_sync(_new_id); 
	
	for (var _i = 0; _i < array_length(player_list); _i++) {
		if (player_list[_i].steam_id == _new_id) {
			_found = true; 
			break; 
		}
	}
	
	if (_found) show_debug_message("[WARNING] Player " + _new_name + " already exist");  
	else {
		array_push(player_list, {
			steam_id: 	_new_id, 
			steam_name: _new_name, 
			character:	undefined, 
		}); 
	}
}

function get_list_idx(_new_id) {
	for (var _i = 0; _i < array_length(player_list); _i++) {
		if (player_list[_i].steam_id = _new_id) {
			return _i; 
		}
	}
	
	show_debug_message("[WARNING] player not found"); 
	return -1; 
}

function spawn_player(_new_id) {
	var _idx = get_list_idx(_new_id); 
	if (_idx == -1) {
		_idx = array_length(player_list); 
		insert_player(_new_id); 
	}
	
	if (player_list[_idx].character == undefined) {
		var _x = random_range(1, room_width-1); 
		var _y = random_range(1, room_height-1); 
		var _layer = layer_get_id("Instances"); 		
		var _inst = instance_create_layer(_x, _y, _layer, obj_player, {
			steam_id: _new_id
		}); 
		
		player_list[_idx].character = _inst; 
	} else {
		show_debug_message("[WARNING] attempt to re-spawn existing player object"); 
	}
}

function erase_player(_player_id) {
	var _idx = get_list_idx(_player_id); 
	
	if (_idx == -1) show_debug_message("[WARNING] attempt to erase player not in the list"); 
	else {
		instance_destroy(player_list[_idx].character); 
		array_delete(player_list, _idx, 1); 
	}
	
}