draw_self(); // Draws the player sprite

draw_set_color(c_white);
// We use 'string()' because you can't add a number to a word directly
draw_text(x, y - 50, "HP: " + string(hp));
draw_text(x, y - 70, "Hits: " + string(hit_count));