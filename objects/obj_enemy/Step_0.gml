/// @description Insert description here
// You can write your code in this editor

y += 0.3; 

if (hp <= 0) {
	instance_destroy(); 
	
	if (global.is_server) {
		with(obj_server) {
			enemy_to_kill--;
		}
	}
	// TODO: you win 
}