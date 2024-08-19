/// @description Insert description here
// You can write your code in this editor
show_debug_message("Client created!"); 

player_list = []; 
steam_id = steam_get_user_steam_id(); 
steam_name = steam_get_user_persona_name_sync(steam_id);
inbuf = buffer_create(16, buffer_grow, 1) 

win = false; 

audio_play_sound(snd_bg, 0, 1); 