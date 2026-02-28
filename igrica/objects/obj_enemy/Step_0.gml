var _target_x = obj_player.x;
var _target_y = obj_player.y;
var _spd = 0.5;
var _tilemap = layer_tilemap_get_id("Tiles_Col");

// Move toward player but stop at Tiles_Col borders
var _dir_x = sign(_target_x - x);
var _dir_y = sign(_target_y - y);
move_and_collide(_dir_x * _spd, _dir_y * _spd, _tilemap);