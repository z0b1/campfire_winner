
// --- Player Stats ---
hp = 10;
hit_count = 0;
hit_timer = 0;
hit_timer_max = 900;
is_invincible = false;
game_finished = false;
move_speed = 2;

// --- Collision Setup (THIS FIXES YOUR CRASH) ---
// Make sure "Tiles_Col" matches the EXACT name of your collision layer
tilemap = layer_tilemap_get_id("Tiles_Col");