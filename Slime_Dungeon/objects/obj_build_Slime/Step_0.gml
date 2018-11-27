/// @description Handles Grid-Based Movement

// Check if player is aligned to the grid.
// If so, process input to decide on movement
if (floor(x mod grid_size) <= move_sp) and (floor(y mod grid_size) <= move_sp) // Check for grid alignment
{
	// What tile is the player on?	
	x_cell = x / grid_size;
	y_cell = y / grid_size;
	
	// Which way should we move?
    var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A")), // Obtain the direction of the horizontal movement
        move_y = keyboard_check(ord("S")) - keyboard_check(ord("W")); // Same as above, but for vertical movement

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


// This is to check if the mouse is over a tile that can be reached
mx_cell = clamp(floor(mouse_x / grid_size), 0, grid_width - 1);
my_cell = clamp(floor(mouse_y / grid_size), 0, grid_height - 1);
		
m_cell = ds_grid_get(obj_Control.map_grid, mx_cell, my_cell);		

x_cell = floor(x / grid_size);
y_cell = floor(y / grid_size);

if(abs(mx_cell - x_cell) <= 1 
 && abs(my_cell - y_cell) <= 1 
 && (my_cell != y_cell 
 || mx_cell != x_cell) 
 && ((mx_cell != 0) && (mx_cell != grid_width - 1) && (my_cell != 0) && (my_cell != grid_height - 1))){
	 mouse_in_valid_pos = true;
 } else {
	 mouse_in_valid_pos = false;
 }

// This does camera tracking
//Get target view position and size. size is halved so the view will focus around its center
vpos_x = camera_get_view_x(view_camera[0]);
vpos_y = camera_get_view_y(view_camera[0]); 

if(keyboard_check(vk_shift)){
	new_x = lerp(vpos_x, clamp(mouse_x - vpos_w - vpos_x, -vpos_w, vpos_w) + obj_build_Slime.x - vpos_w + 32, rate);
	new_y = lerp(vpos_y, clamp(mouse_y - vpos_h - vpos_y, -vpos_h, vpos_h) + obj_build_Slime.y - vpos_h + 32, rate);
} else {
//Interpolate the view position to the new, relative position.
	new_x = lerp(vpos_x, obj_build_Slime.x - vpos_w + 32, rate);
	new_y = lerp(vpos_y, obj_build_Slime.y - vpos_h + 32, rate);
}

//Update the view position
//camera_set_view_pos(view_camera[0], new_x, new_y);


camera_set_view_pos(view_camera[0],
	clamp( new_x, 0, room_width - vpos_w * 2 ),
    clamp( new_y, 0, room_height - vpos_h * 2 ));
