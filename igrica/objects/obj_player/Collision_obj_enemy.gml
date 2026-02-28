// This runs inside obj_player when touching an enemy
if (!is_invincible) 
{
    hp -= 1;
    hit_count += 1;
    hit_timer = hit_timer_max;
    
    image_blend = c_red;
    alarm[0] = 10; 
    
    is_invincible = true;
    alarm[1] = 30; 

    if (hp <= 0 || hit_count >= 10) 
    {
        room_restart();
    }
}