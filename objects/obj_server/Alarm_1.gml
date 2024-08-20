/// @description Spawn enemies
// You can write your code in this editor

function broadcast_spawn_enemy(_exclude, _x) {
	for (var _i = 0; _i < array_length(player_list); _i++) {
		if (!array_contains(_exclude, player_list[_i].steam_id)) {
			send_spawn_enemy(player_list[_i].steam_id, _x); 
		}
	}
}

function spawn_enemy_random() {
	var _inst = spawn_enemy(random_range(1, room_width - 10)); 
	broadcast_spawn_enemy([steam_id], _inst.x); 
}

if (enemy_to_spawn > 0) {
	enemy_to_spawn--; 
	spawn_enemy_random(); 
	alarm[1] = room_speed * 5; 
}