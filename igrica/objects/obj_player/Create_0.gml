face = "down";
hp = 10;                // Starting health
hit_count = 0;          // How many times hit recently
hit_timer_max = 15 * 60; // 15 seconds (assuming 60fps)
hit_timer = 0;          // The actual countdown
is_invincible = false;  // Prevents multiple hits in one frame
