// --- 1. SETUP ---
move_speed = 1;
tilemap = layer_tilemap_get_id("Tiles_Col");
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// --- 2. TIMER LOGIC ---
if (hit_timer > 0) hit_timer -= 1;
else hit_count = 0;

// --- 3. MOVEMENT (Anti-Stuck Version) ---
if (_hor != 0 || _ver != 0) {
    // Arguments: xsp, ysp, tilemap, iterations, margin
    // The '1' margin helps stop the player from "embedding" in walls
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, 4, 1);
}

// --- 4. TELEPORT LOGIC (3 Locations) ---
// Location 1
if (point_distance(x, y, 1312, 64) < 16) {
    x = 40; y = 240;
} 
// Location 2
else if (point_distance(x, y, 1312, 224) < 16) {
    x = 73; y = 386;
}
// Location 3 (NEW)
else if (point_distance(x, y, 635, 56) < 16) {
    x = 742; y = 70;
}

// --- 5. ANIMATION LOGIC ---
if (_hor != 0 or _ver != 0) {
    if (_ver > 0) sprite_index = spr_player_walk_down;
    else if (_ver < 0) sprite_index = spr_player_walk_up;
    else if (_hor > 0) sprite_index = spr_player_walk_right;
    else if (_hor < 0) sprite_index = spr_player_walk_left;
} else {
    if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
    else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
    else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;
}