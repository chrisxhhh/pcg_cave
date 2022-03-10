
draw_set_font(Font1);
draw_set_color(c_red);
draw_text(20, 20, "level: " + string(current_level));
draw_text(20, 60, "depth: " + string(player_depth));
draw_text(20, 100, "time: " + string(round(timer / room_speed)));
draw_set_color(c_white);
