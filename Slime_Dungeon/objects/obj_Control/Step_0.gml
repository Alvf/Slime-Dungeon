/// @description Handles camera tracking
// You can write your code in this editor


//Get target view position and size. size is halved so the view will focus around its center
vpos_x = camera_get_view_x(view_camera[0]);
vpos_y = camera_get_view_y(view_camera[0]); 

//Interpolate the view position to the new, relative position.
new_x = lerp(vpos_x, obj_build_Slime.x - vpos_w + 32, rate);
new_y = lerp(vpos_y, obj_build_Slime.y - vpos_h + 32, rate);

//Update the view position
camera_set_view_pos(view_camera[0], new_x, new_y);


camera_set_view_pos(view_camera[0],
	clamp( camera_get_view_x(view_camera[0]), 0, room_width - camera_get_view_width(view_camera[0]) ),
    clamp( camera_get_view_y(view_camera[0]), 0, room_height - camera_get_view_height(view_camera[0]) ));