/// @description Handles Grid-Based Movement

// Check if player is aligned to the grid.
// If so, process input to decide on movement
if (floor(x mod obj_Control.grid_size) <= move_sp) and (floor(y mod obj_Control.grid_size) <= move_sp) // Check for grid alignment
{
	// What tile is the player on?	
	x_cell = x / obj_Control.grid_size;
	y_cell = y / obj_Control.grid_size;
	
	// Which way should we move?
    var move_x = keyboard_check(vk_right) - keyboard_check(vk_left), // Obtain the direction of the horizontal movement
        move_y = keyboard_check(vk_down) - keyboard_check(vk_up); // Same as above, but for vertical movement

    hsp = 0; // Reset speed values
    vsp = 0;

	
	// Collision detection 
	if ((move_x > 0 && ds_grid_get(obj_Control.map_grid, x_cell + 1, y_cell) != 1)
		|| (move_x < 0 && ds_grid_get(obj_Control.map_grid, x_cell - 1, y_cell) != 1)) {
		move_x = 0;
	}
	
	if ((move_y > 0 && ds_grid_get(obj_Control.map_grid, x_cell, y_cell + 1) != 1)
		|| (move_y < 0 && ds_grid_get(obj_Control.map_grid, x_cell, y_cell - 1) != 1)) {
		move_y = 0;
	}
	
	
	if (move_x != 0) and (move_y != 0)
    {
        move_y = 0; // Quick and dirty check to prevent diagonal movement
    }
	
    hsp = move_x * move_sp; // Set the movement speeds based on movement direction
    vsp = move_y * move_sp;
}



x += hsp; // Move the instance if appllcable
y += vsp;