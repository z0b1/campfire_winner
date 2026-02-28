
if (!variable_instance_exists(id, "is_invincible")) is_invincible = false;

// What happens when the player is hit
if (!is_invincible) {
    // 1. Basic Damage
    hp -= 1;
    hit_count += 1;
    
    // 2. Start/Reset the 15-second window
    hit_timer = hit_timer_max; 
    
    // 3. Feedback (Red Flash)
    image_blend = c_red;
    alarm[0] = 10; // Reset color alarm
    
    // 4. Temporary Invincibility (Half-second)
    is_invincible = true;
    alarm[1] = 30; 

    // 5. Restart Conditions
    // Restart if total HP is 0 OR if hit 10 times in the window
    if (hp <= 0 || hit_count >= 10) {
        room_restart();
    }
}