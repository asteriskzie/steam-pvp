//show_debug_message("[DEB] value di creation code = " + string(obj_game.is_server)); 
if (global.is_server) {
	global.controller = instance_create_depth(0,0,0,obj_server); 
} else {
	global.controller = instance_create_depth(0,0,0,obj_client); 
}
