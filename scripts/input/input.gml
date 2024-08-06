function get_controls(_local)
{
	if _local {
		//Directions inputs
		right_key = keyboard_check(vk_right) ||keyboard_check(ord("D")) || gamepad_button_check( 0, gp_padr );
		right_key = clamp( right_key, 0, 1 );
		left_key  = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check( 0, gp_padl );
		left_key  = clamp( left_key, 0, 1 );
		down_key  = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check( 0, gp_padd );
		down_key  = clamp( down_key, 0, 1 );
		up_key  = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check( 0, gp_padu );
		up_key  = clamp( up_key, 0, 1 );
		all_dir = right_key+left_key+down_key+up_key
		
		//Action inputs
		run_key = keyboard_check(vk_shift) || gamepad_button_check( 0, gp_face3 );
		action_key = keyboard_check_pressed(vk_space) || mouse_check_button(mb_left) || gamepad_button_check( 0, gp_face2 );
	}

}

function init_controls(){
	//Directions inputs
	right_key	= 0
	left_key	= 0
	down_key	= 0
	up_key		= 0
	
	//Action inputs
	run_key		= 0
	action_key	= 0
		
}