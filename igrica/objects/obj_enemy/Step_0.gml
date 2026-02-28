// 1. Follow the player
if (instance_exists(obj_player)) {
    var _dir = point_direction(x, y, obj_player.x, obj_player.y);
    var _spd = 0.5; // Slower than player
    
    // Move towards player if they are within 200 pixels
    if (point_distance(x, y, obj_player.x, obj_player.y) < 200) {
        x += lengthdir_x(_spd, _dir);
        y += lengthdir_y(_spd, _dir);
    }
}

// 2. Attack Logic (Collision)
if (place_meeting(x, y, obj_player)) {
    // This triggers the "hit" logic on the player
    with(obj_player) {
        event_user(0); // Trigger a custom event for getting hit
    }
}