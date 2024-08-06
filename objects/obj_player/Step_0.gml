/// @description  Insert description here

get_controls(is_local);
 
player_movement(); 

if (hp <= 0) {
	// game over 
	instance_destroy(); 
}