
var tile_id = layer_tilemap_get_id(layer_get_id("tile_map"));

for (var i = 0; i < grid_width; i++) {
		for (var j = 0; j < grid_height; j++) {
			var tile = ds_grid_get(obj_Control.map_grid, i, j);
			if (tile == ds_wall){
				if (j < grid_height){
					var tile_below = ds_grid_get(obj_Control.map_grid, i, j+1);
					if(tile_below == ds_wall){
						tile = tile_wall_top;
					} else {
						tile = tile_wall_front;
					}
				}
			}
			if (tile == ds_gold) {
				tile = ds_floor;
				instance_create_layer(i*grid_size, j*grid_size, "Instances", obj_Gold);
			}
			tilemap_set(tile_id, tile, i, j);
		}
	}