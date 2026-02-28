// --- 1. Inputs & Movement ---
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (_hor != 0) last_dir_x = _hor; // Remember which way we face

if (_hor != 0 || _ver != 0) {
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, 4, 0, 0, 1, 1);
}

// --- 2. ATTACK LOGIC (Place the code here!) ---
if (mouse_check_button_pressed(mb_left)) {
    // Create the hit zone in front of the player
    var _hit_x = x + (last_dir_x * 40);
    var _inst = collision_rectangle(_hit_x - 20, y - 20, _hit_x + 20, y + 20, obj_enemy, false, true);
    
    // THIS IS THE BLOCK YOU ASKED ABOUT:
    if (_inst != noone) {
        // 1. Destroy the enemy
        instance_destroy(_inst);
        
        // 2. Play the sound (Make sure snd_hit is the name in your assets!)
        audio_play_sound(snd_hit, 1, false);
        
        // 3. Update stats
        hit_count += 1; 
        
        show_debug_message("Hit! Enemy gone and sound played.");
    }
}


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