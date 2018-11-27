/// @description Building/Destroying

// Only let the player place things in the 8 tiles around them
if(mouse_in_valid_pos){
	 
	// Depending on the tool, and the tile already present, 
	// decide what should be placed and how resources should be changed.
	if(current_tool == 2 && rock > 0){
		if(m_cell == 1){
			// Placing Rock
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, ds_wall);
			
			var tile_below = ds_grid_get(obj_Control.map_grid, mx_cell, my_cell + 1);
			
			if(tile_below == ds_wall){
				tilemap_set(obj_Control.tile_id, tile_wall_top, mx_cell, my_cell);
			} else {
				tilemap_set(obj_Control.tile_id, tile_wall_front, mx_cell, my_cell);
			}

			// tile above
			if(ds_grid_get(obj_Control.map_grid, mx_cell, my_cell-1) == ds_wall){
				tilemap_set(obj_Control.tile_id, tile_wall_top, mx_cell, my_cell-1);
			}
			rock--;
			audio_play_sound(choose(snd_build1, snd_build2), 10, false)
		} 
	}else if (current_tool == 1) {
		if(m_cell == 4){
			rock++;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 1);
			tilemap_set(obj_Control.tile_id, 1, mx_cell, my_cell);
			if(tilemap_get(obj_Control.tile_id, mx_cell, my_cell-1) == 2){
				tilemap_set(obj_Control.tile_id, 4, mx_cell, my_cell-1);
			}
			audio_play_sound(choose(snd_break1, snd_break2), 10, false)
		}else if(m_cell == 3){
			gold++;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 1);
			instance_destroy(treasure);
			
			//tilemap_set(obj_Control.tile_id, 1, mx_cell, my_cell);
		}
	}else if (current_tool == 3) {
		if(gold > 0 && m_cell == 1){
			gold--;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 3);
			treasure = instance_create_layer(mx_cell*64, my_cell*64, "Instances", obj_Gold);
			//tilemap_set(obj_Control.tile_id, 3, mx_cell, my_cell);
		}	
	}
	
}