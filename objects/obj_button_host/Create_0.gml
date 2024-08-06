/// @description Insert description here
// You can write your code in this editor

event_inherited(); 

select_action = function () {
	global.server = instance_create_depth(0,0,0,obj_server); 
	steam_lobby_create(steam_lobby_type_public, 2); 
}