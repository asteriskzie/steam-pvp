/// @description Manage death cooldown 
// You can write your code in this editor
for (var _i = 0; _i < array_length(player_list); _i++) {
	if (player_list[_i].character.death_cooldown != 0) {
		player_list[_i].character.death_cooldown--; 
		if (player_list[_i].character.death_cooldown == 0) {
			instance_activate_object(player_list[_i].character); 
			player_list[_i].character.hp = 100; 
		}
	}
}

alarm[0] = room_speed; 