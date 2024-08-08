/// @description Insert description here
// You can write your code in this editor

show_debug_message("obj_server is created"); 

// Server object will run on the host's machine 
player_list = [] 

// get steam data 
steam_id = steam_get_user_steam_id(); 
steam_name = steam_get_user_persona_name(steam_id); 

player_list[0] = {
	steam_id: steam_id, 
	steam_name: steam_name, 
	character: undefined, 
	death_cooldown: 0,
}

alarm[0] = 12