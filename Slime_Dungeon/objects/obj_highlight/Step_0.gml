/// @description Build overlay

x = floor(mouse_x / 64) * 64;
y = floor(mouse_y / 64) * 64;

if(obj_build_Slime.mouse_in_valid_pos){
	if((obj_build_Slime.current_tool == 2 && obj_build_Slime.rock > 0)
		|| obj_build_Slime.current_tool == 1){
			image_index = 0;
	} else {
		image_index = 1;
	}
} else {
	image_index = 1;
}