/// @description Listening for lobby creation
// You can write your code in this editor

switch(async_load[?"event_type"]) {
	case "lobby_created": 
		show_debug_message("Lobby created"); 		
		steam_lobby_join_id(steam_lobby_get_lobby_id()); 
		break; 
		
	case "lobby_joined": 
		show_debug_message("Lobby joined."); 
		if (steam_lobby_is_owner()) 
		{		
				steam_lobby_set_data("isGameMakerTest", "true"); 
				steam_lobby_set_data("Creator", steam_get_persona_name());  
		}	
		
		global.is_server = true; 
		room_goto(rm_gameroom); 
		
		break; 
}