/// @description Draw the textbox!
// You can write your code in this editor
draw_sprite(box, 0, box_x, box_y);
draw_sprite(frame, 0, port_x, port_y);
draw_sprite(portrait, portrait_index, port_x, port_y); 
draw_sprite(frame, 1, port_x, port_y);
draw_sprite(namebox, 0, name_x, name_y);


// font = fnt_text_12;

draw_set_halign(fa_center); draw_set_valign(fa_middle);

draw_text_color(name_text_x, name_text_y, name, name_col, name_col, name_col, name_col, 1);

draw_set_halign(fa_left); draw_set_valign(fa_top);

draw_text_color(text_x, text_y, text, text_col, text_col, text_col, text_col, 1);