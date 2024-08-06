///// @description Spawn Players
show_debug_message("[DEB] Room start dipanggil"); 

var _player_layer = layer_get_id("Instances"); 

// servernya perlu ngelist ada user apa aja 
for (var _i = 0; _i < array_length(player_list); _i++) {
	var _x = room_width/2; 
	var _y = room_height/2; 
	
	var _inst = instance_create_layer(_x, _y, _player_layer, obj_player, {
		steam_id : player_list[_i].steam_id,
	}); 
	
	player_list[_i].character = _inst; 
}
