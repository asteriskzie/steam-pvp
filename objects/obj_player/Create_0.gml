/// @description Setup player
// You can write your code in this editor

local_steam_id = steam_get_user_steam_id(); 
is_local = (steam_id == local_steam_id);

move_speed = 1; 
is_cooldown = false; 
death_cooldown = 0; 

init_controls(); 