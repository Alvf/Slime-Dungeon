/// @description Building/Destroying
// You can write your code in this editor

mx_cell = floor(mouse_x / obj_Control.grid_size);
my_cell = floor(mouse_y / obj_Control.grid_size);
		
x_cell = floor(x / obj_Control.grid_size);
y_cell = floor(y / obj_Control.grid_size);
		
		
show_debug_message("mouse pressed: " + string(mx_cell) + ", " + string(my_cell) + "   " + string(x_cell) + ", " + string(y_cell));

// Only let the player place things in the 8 tiles around them
if(abs(mx_cell - x_cell) <= 1 
 && abs(my_cell - y_cell) <= 1 
 && (my_cell != y_cell 
 || mx_cell != x_cell)){
	// Depending on the tool, and the tile already present, 
	// decide what should be placed and how resources should be changed.
	if(current_tool == 2 && rock > 0){
		if(ds_grid_get(obj_Control.map_grid, mx_cell, my_cell) == 1){
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 2);
			tilemap_set(obj_Control.tile_id, 2, mx_cell, my_cell);
			rock--;
		} 
	}else if (current_tool == 1) {
		if(ds_grid_get(obj_Control.map_grid, mx_cell, my_cell) == 2){
			rock++;
			ds_grid_set(obj_Control.map_grid, mx_cell, my_cell, 1);
			tilemap_set(obj_Control.tile_id, 1, mx_cell, my_cell);
		}
	}
	
}