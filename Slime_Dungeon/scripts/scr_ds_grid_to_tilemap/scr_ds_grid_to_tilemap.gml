
var tile_id = layer_tilemap_get_id(layer_get_id("tile_map"));

for (var i = 0; i < obj_Control.grid_width; i++) {
		for (var j = 0; j < obj_Control.grid_height; j++) {
			tilemap_set(tile_id, ds_grid_get(obj_Control.map_grid, i, j), i, j);
		}
	}