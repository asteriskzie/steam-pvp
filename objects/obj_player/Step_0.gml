/// @description  Insert description here

if (is_local) {
	get_controls(is_local);
	player_movement(); 
}

if (hp <= 0) {
	// game over 
	instance_destroy(); 
}