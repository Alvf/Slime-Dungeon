/// @description Load and create tilemap
// You can write your code in this editor

// Fix VSYNC issues
display_reset(0, true);


// Create the tilemap
grid_size = 64;

grid_width = 20;
grid_height = 14;

// Set this to true to load from the tilemap in the gamemaker editor.
// If it's false, this will just create a box around the edge.
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
	
	script_execute(scr_ds_grid_to_tilemap);	
}