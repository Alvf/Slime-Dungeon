/// @description Load and create tilemap
// You can write your code in this editor

display_reset(0, true);


grid_size = 64;

grid_width = 20;
grid_height = 14;

load_from_tilemap = true;

map_grid = ds_grid_create(grid_width,grid_height);

tile_layer_id = layer_get_id("tile_map");
tile_id = layer_tilemap_get_id(tile_layer_id);


if(load_from_tilemap) {
	for(var i = 0; i < grid_width; i++){
		for(var j = 0; j < grid_height; j++){
			ds_grid_set(map_grid, i, j, tilemap_get(tile_id, i, j));
		}
	}
} else {
	for (var i = 0; i < grid_width; i++ ){
		for (var j = 0; j < grid_height; j++ ){
			if(i == 0 || i == grid_width - 1 || j == 0 || j == grid_height - 1){
				ds_grid_set(map_grid, i, j, 2);
			}else{
				ds_grid_set(map_grid, i, j, 1);
			}
		}
	}
	
	for (var i = 0; i < grid_width; i++) {
		for (var j = 0; j < grid_height; j++) {
			tilemap_set(tile_id, ds_grid_get(map_grid, i, j), i, j);
		}
	}
}


// Camera tracking code:

rate = 0.2;
vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

vpos_x = camera_get_view_x(view_camera[0]);
vpos_y = camera_get_view_y(view_camera[0]);

new_x = 0;
new_y = 0;