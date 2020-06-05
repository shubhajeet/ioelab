int x, y;
while(1) {
         while(!go_i);
         x = x_i;
         y = y_i;
         lcm_x = x_i;
         lcm_y = y_i;
         while(lcm_x != lcm_y) {
                 if (lcm_x < lcm_y)
                    lcm_x += x;
                 else
                    lcm_y += y;
                 }
         d_o = lcm_x;
        }
