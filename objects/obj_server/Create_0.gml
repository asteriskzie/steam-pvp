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
}



alarm[0] = room_speed
inbuf = buffer_create(16, buffer_grow, 1) 

// spawn enemy 
alarm[1] = room_speed * 5
enemy_to_spawn = 5; 
enemy_to_kill = enemy_to_spawn; 
win = false; 

audio_play_sound(snd_bg, 0, 1); 