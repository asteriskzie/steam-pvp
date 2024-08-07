/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_xscale = 5
image_yscale = .5

select_action = function() {
	global.is_server = false; 
	room_goto(rm_gameroom); 
}