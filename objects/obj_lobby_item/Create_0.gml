/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_xscale = 5
image_yscale = .5

select_action = function() {
	if (lobby_id == -1) return; 
	
	global.is_server = false; 
	steam_lobby_join_id(lobby_id); 
	room_goto(rm_gameroom); 
}