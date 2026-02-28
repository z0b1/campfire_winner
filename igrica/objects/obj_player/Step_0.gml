// --- 1. SETUP & INPUT ---
move_speed = 1;
tilemap = layer_tilemap_get_id("Tiles_Col");
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// --- 2. HIT TIMER LOGIC ---
if (hit_timer > 0) hit_timer -= 1;
else hit_count = 0;

// --- 3. MOVEMENT ---
if (_hor != 0 || _ver != 0) {
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, 4, 1);
}

// --- 4. TELEPORT LOGIC (4 Locations) ---
if (point_distance(x, y, 1312, 64) < 16) {
    x = 40; y = 240;
} 
else if (point_distance(x, y, 1312, 224) < 16) {
    x = 73; y = 386;
} 
else if (point_distance(x, y, 635, 56) < 16) {
    x = 742; y = 70;
}
// NEW TELEPORT
else if (point_distance(x, y, 775, 70) < 16) {
    x = 1046; y = 66;
}

// --- 5. ATTACK ENEMY (Mouse Click) ---
if (mouse_check_button_pressed(mb_left)) {
    var _target = instance_nearest(x, y, obj_enemy);
    if (_target != noone && point_distance(x, y, _target.x, _target.y) < 40) {
        instance_destroy(_target);
        image_xscale = 1.2;
        alarm[2] = 5;
    }
}

// --- 6. ANIMATION LOGIC ---
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