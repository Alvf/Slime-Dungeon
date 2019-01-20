/// @description Insert description here
// You can write your code in this editor
box = spr_textbox;
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);

frame = spr_portrait_frame;
frame_width = sprite_get_width(frame);
frame_height = sprite_get_height(frame);

portrait = spr_portraits;
port_width = sprite_get_width(frame);
port_height = sprite_get_height(frame);

namebox = spr_namebox;
name_width = sprite_get_width(namebox);
name_height = sprite_get_height(namebox);

port_x = (global.game_width - box_width - port_width) * 0.5
port_y = (global.game_height*0.98 - port_height);

box_x = port_x + port_width;
box_y = port_y;

name_x = port_x;
name_y = box_y - name_height;

portrait_index = 0;

text = "this some dialogue this some dialogue this some dialogue this some dialogue this some dialogue this some dialogue this some dialogue this some dialogue this some dialogue"
name = "Someone"

text_col = c_black;
name_col = c_black;

x_buffer = 12;
y_buffer = 8;

text_x = box_x + x_buffer;
text_y = box_y + y_buffer;

name_text_x = name_x + (name_width * 0.5);
name_text_y = name_y + 0.5 * name_height;

