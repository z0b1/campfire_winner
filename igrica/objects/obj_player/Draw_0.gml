draw_self(); // <--- THIS BRINGS YOUR CHARACTER BACK!

// If you have the "Good Game" code here, it's okay, 
// but make sure draw_self() is above it.// Draw HP and Hits at the top left
draw_set_color(c_white);
draw_text(20, 20, "HP: " + string(hp));
draw_text(20, 40, "Recent Hits: " + string(hit_count));

// Draw Win Message
if (game_finished) {
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    draw_set_alpha(1);
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/2, "GOOD GAME! YOU WON!\nTHANKS FOR PLAYING", 2, 2, 0);
}