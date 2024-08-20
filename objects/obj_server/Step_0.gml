/// @description Insert description here
// You can write your code in this editor

if (!win && enemy_to_kill == 0) {
	win = true; 
	for (var _i = 0; _i < array_length(player_list); _i++) {
		if (player_list[_i].steam_id != steam_id) {
			send_win(player_list[_i].steam_id); 
		}	
	}
}