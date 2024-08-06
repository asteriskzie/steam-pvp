/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// copas dari project SteamMultiplayer
select_action = function() {
		// Disable other buttons
		for (var _i = 0; _i < 5; _i++){
			var _inst = instance_find(obj_button,_i)
			if _inst != noone then _inst.disabled = true;
		}
		
		
		// Spawn lobby list 
		var _lobby_list = instance_create_depth(160,30,-10,obj_lobby_list) /// idk -10 dari mana :D
		_lobby_list.image_xscale = 2
		_lobby_list.image_yscale = 2
		var _lobby_item = instance_create_depth(_lobby_list.x, _lobby_list.bbox_top+40,-20,obj_lobby_item)
		_lobby_list.lobby_list[0] = _lobby_item
		_lobby_list.alarm[0] = 1
	
}