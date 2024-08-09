/// @description Insert description here
// You can write your code in this editor

while(steam_net_packet_receive()) {
	// TODO: reset buffer 
	var _type = buffer_read(inbuf, buffer_u8); 
	
	switch(_type) {
		case PACKET.INIT_CONNECTION: 
			
	}
}