// Stats and Logic
hp = 10;
hit_count = 0;
hit_timer = 0;
hit_timer_max = 900;
is_invincible = false;
game_finished = false;
move_speed = 2;

// COLLISION SETUP (This is what line 7 is looking for!)
tilemap = layer_tilemap_get_id("Tiles_Col");
last_dir_x = 1; // 1 for right, -1 for left
// Sets the 'ears' of the game to the player's position
audio_listener_position(x, y, 0);