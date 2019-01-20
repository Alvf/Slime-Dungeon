/// @description Insert description here
// You can write your code in this editor
var c = c_black;

draw_set_colour(c);

items[0] = "inf"
items[1] = string(obj_build_Slime.rock);
items[2] = string(obj_build_Slime.gold);

var i;
for (i = 0; i < num_tiles; i+=1){
	draw_sprite(spr_loadout, i, i * 128, 0);
	draw_text(i * 128, 110, items[i]);
}