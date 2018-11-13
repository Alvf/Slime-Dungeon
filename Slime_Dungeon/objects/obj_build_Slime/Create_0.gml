/// @description Setup speeds, tools
// You can write your code in this editor

// This decides what the player places when they click
current_tool = 1;

// This is how much rock they have left
rock = 4;

// Change this one to change how fast the character moves
move_sp = 7; // Movement speed 

// Don't change these ones
hsp = 0; // Horizontal movement speed
vsp = 0; // Vertical movement speed 

cell_x = 0; cell_y = 0;

mouse_in_valid_pos = false;

mx_cell = 0;
my_cell = 0;
m_cell = 0;

// Camera tracking 
rate = 0.2;
vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
vpos_h = camera_get_view_height(view_camera[0]) * 0.5;