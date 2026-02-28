draw_set_color(c_white);
draw_text(20, 20, "HP: " + string(hp));
draw_text(20, 40, "HITS: " + string(hit_count));

if (game_finished) {
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0,0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    draw_set_color(c_yellow);
    draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "GOOD GAME!");
}