/// @description Build overlay

x = obj_build_Slime.mx_cell * 64;
y = obj_build_Slime.my_cell * 64;

// This part determines whether to show a red, blue, or green 
// overlay, and how bright it should be.

if(obj_build_Slime.mouse_in_valid_pos){
	image_alpha = 0.9;
} else {
	image_alpha = 0.3;
}

if(obj_build_Slime.current_tool == 2){
	if (obj_build_Slime.m_cell == 1 && obj_build_Slime.rock > 0){
		image_index = 1;
	} else {
		image_index = 2;
	}
} else if (obj_build_Slime.current_tool == 1){
	image_index = 0;
} 