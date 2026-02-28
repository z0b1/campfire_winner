/// --- 1. Update Facing Direction ---
// --- 1. DEFINE INPUTS (Check these lines!) ---
// Right (D) - Left (A) = 1 (Right), -1 (Left), or 0 (None/Both)
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));

// Down (S) - Up (W) = 1 (Down), -1 (Up), or 0 (None/Both)
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Update facing direction for the attack hitbox
if (_hor != 0) last_dir_x = _hor; 

// --- 2. THE MOVEMENT ---
if (_hor != 0 || _ver != 0) {
    // We multiply the direction by speed
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, 4, 0, 0, 1, 1);
}
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
if (_hor != 0) last_dir_x = _hor; 

// --- 2. DIRECTIONAL ATTACK LOGIC ---
if (mouse_check_button_pressed(mb_left)) {
    // Define a hit box 40 pixels in front of the player
    // This makes it impossible to kill enemies behind you!
    var _hit_x = x + (last_dir_x * 40);
    var _hit_y = y;
    
    // Look for enemies ONLY in that specific spot
    var _inst = collision_rectangle(_hit_x - 20, _hit_y - 20, _hit_x + 20, _hit_y + 20, obj_enemy, false, true);
    
    if (_inst != noone) {
        instance_destroy(_inst);
        show_debug_message("Skill hit registered!");
    }
}
// --- 3. TELEPORTS & WIN CONDITION ---
// Teleport 1: To Safe Zone (Fixes sticking at 65, 237)
// Teleport 1: Moved even further to ensure NO wall contact
if (point_distance(x, y, 1312, 64) < 16) { 
    x = 120; // Moved right to 120
    y = 230; // Moved down to 280
}
 // Teleport 2
else if (point_distance(x, y, 1312, 224) < 16) { 
    x = 73; 
    y = 386; 
}
// Teleport 3
else if (point_distance(x, y, 635, 56) < 16) { 
    x = 742; 
    y = 70; 
}
// Teleport 4
else if (point_distance(x, y, 775, 70) < 16) { 
    x = 1046; 
    y = 66; 
}
// --- 3. TELEPORTS ---
else if (point_distance(x, y, 1312, 64) < 16) { 
    x = 120; y = 280; 
} 
// NEW TELEPORT: From 934, 252 to 1235, 241
else if (point_distance(x, y, 934, 252) < 20) { 
    x = 1235; 
    y = 241; 
}
else if (point_distance(x, y, 1312, 224) < 16) { x = 73; y = 386; }
else if (point_distance(x, y, 635, 56) < 16) { x = 742; y = 70; }
else if (point_distance(x, y, 775, 70) < 16) { x = 1046; y = 66; }
else if (point_distance(x, y, 1270, 579) < 20) { game_finished = true; }
// WIN CONDITION: Final Destination
else if (point_distance(x, y, 1270, 579) < 20) { 
    game_finished = true; 
}