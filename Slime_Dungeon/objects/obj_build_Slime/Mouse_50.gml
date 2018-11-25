/// @description Building/Destroying

// Only let the player place things in the 8 tiles around them
if(mouse_in_valid_pos){
	 
	// Depending on the tool, and the tile already present, 
	// decide what should be placed and how resources should be changed.
	if(current_tool == 2 && rock > 0){
		if(m_cell == 1){
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 2);
			tilemap_set(obj_Control.tile_id, 2, mx_cell, my_cell);
			rock--;
			audio_play_sound(choose(snd_build1, snd_build2), 10, false)
		} 
	}else if (current_tool == 1) {
		if(m_cell == 2){
			rock++;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 1);
			tilemap_set(obj_Control.tile_id, 1, mx_cell, my_cell);
			audio_play_sound(choose(snd_break1, snd_break2), 10, false)
		}else if(m_cell == 3){
			gold++;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 1);
			tilemap_set(obj_Control.tile_id, 1, mx_cell, my_cell);
		}
	}else if (current_tool == 3) {
		if(gold > 0 && m_cell == 1){
			gold--;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 3);
			tilemap_set(obj_Control.tile_id, 3, mx_cell, my_cell);
		}	
	}
	
}