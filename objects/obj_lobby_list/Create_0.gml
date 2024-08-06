/// @description Settup Lobby List

lobby_list = [] 
show_debug_message("[DEBUG] A new obj_LobbyList instance is created!"); 

//image_xscale = xScale 
//image_yscale = yScale; 

// kasih filter buat memudahkan searching
// nanti filternya ganti, this is just a dummy one
steam_lobby_list_add_string_filter("isGameMakerTest", "true", steam_lobby_list_filter_eq); 
steam_lobby_list_request();

reset_lobby_list = function () {
	for (var _i = 0; _i < array_length(lobby_list); _i++) {
		show_debug_message("Deleting: " + string(lobby_list[_i])); 
		instance_destroy(lobby_list[_i]); 
	}
	lobby_list = []; 
}