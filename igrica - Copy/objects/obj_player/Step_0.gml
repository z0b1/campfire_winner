// 1. INPUT - Kontrole (WASD i Strelice)
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var _down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

// 2. BRZINA (Postavljena na 2 za sporije kretanje)
var _hspd = (_right - _left) * 2;
var _vspd = (_down - _up) * 2;

// 3. HORIZONTALNA KOLIZIJA (Levo/Desno) sa obj_col
if (place_meeting(x + _hspd, y, obj_col)) {
    while (!place_meeting(x + sign(_hspd), y, obj_col)) {
        x += sign(_hspd);
    }
    _hspd = 0;
}
x += _hspd;

// 4. VERTIKALNA KOLIZIJA (Gore/Dole) sa obj_col
if (place_meeting(x, y + _vspd, obj_col)) {
    while (!place_meeting(x, y + sign(_vspd), obj_col)) {
        y += sign(_vspd);
    }
    _vspd = 0;
}
y += _vspd;

// 5. SMER I ANIMACIJA (Tvoji sprite-ovi sa slike)
if (_hspd != 0 || _vspd != 0) {
    // Određivanje pravca gledanja
    if (_vspd < 0)      face = "up";
    else if (_vspd > 0) face = "down";
    else if (_hspd > 0) face = "right";
    else if (_hspd < 0) face = "left";
    
    // Postavljanje WALK sprite-a
    if (face == "up")    sprite_index = spr_player_walk_up;
    if (face == "down")  sprite_index = spr_player_walk_down;
    if (face == "right") sprite_index = spr_player_walk_right;
    if (face == "left")  sprite_index = spr_player_walk_left;
} else {
    // Postavljanje IDLE sprite-a kada lik stoji
    if (face == "up")    sprite_index = spr_player_idle_up;
    if (face == "down")  sprite_index = spr_player_idle_down;
    if (face == "right") sprite_index = spr_player_idle_right;
    if (face == "left")  sprite_index = spr_player_idle_left;
}
