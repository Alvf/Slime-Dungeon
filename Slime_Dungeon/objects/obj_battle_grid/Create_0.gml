/// @description Create a grid of nodes
// You can write your code in this editor
globalvar map;

mapWidth = room_width/64;
mapHeight = room_height/64;

//time to actually make the grid! All grid node-y information goes into layer -1

for(xx = 0; xx<mapWidth; xx+=1){
	for(yy = 0; yy<mapHeight; yy+=1){
		map[xx,yy] = instance_create_layer(xx*64,yy*64,500,obj_battle_node);
	}
}