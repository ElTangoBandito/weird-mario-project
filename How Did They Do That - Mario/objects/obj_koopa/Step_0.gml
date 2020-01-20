/// @description Meat and potatoes FSM

//Flip direction when I touch something, make sure I am not dying by fireball
if (place_meeting(x, y, par_brick) && int_state < 4){
    while(place_meeting(x, y, par_brick)){
        x += -int_dir
    }
    int_dir *= -1;
}

//Match image_xscale to direction
image_xscale = int_dir;

//What state am I currently in?
switch(int_state){
    case 0:
    if (place_meeting(x, y + 1, par_brick)){
        x += int_dir * 2;
    }else{
        int_gravity = 0;
        int_state = 1;
    }
    break;
    //Falling
    case 1:
    if (place_meeting(x, y + 1, par_brick)){
        int_state = 0;
    }else{
        x += int_dir * 2;
        y += int_gravity;
        if (int_gravity < 18){
            int_gravity += 1.5;
        }
        if (place_meeting(x, y, par_brick)){
            y = floor(y);
            while(place_meeting(x, y, par_brick)){
                y --;
            }
            int_state = 0;
        }
    }
    break;
    //Squashed (koopashell)
    case 2:
    //Do nothing and wait
    if (alarm[0] == -1){
        alarm[0] = room_speed * 3;//This is how I grow back out
    }
    break;
    
    case 3:
    //Bounce back and forth
    x += int_dir * 15;
    alarm[0] = -1;
    var t = instance_place(x, y, par_enemy);
    if (t > -4){
        with(t){
            event_user(1);
        }
    }   
    break;
    
    //Hit by fireball
    case 4:
    var a = -sign(-18 + int_gravity);
    if (a <> 0){
        image_yscale = a;
    }
    y += -18 + int_gravity;
    if (int_gravity < 36){
        int_gravity ++;
    }
    if (y > room_height + 100){
        instance_destroy();
    }
    break;
}
    

