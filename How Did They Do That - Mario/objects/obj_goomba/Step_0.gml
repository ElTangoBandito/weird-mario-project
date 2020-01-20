/// @description Meat and potatoes FSM

//Move in this direction (only if I am not squashed or hit by fireball)
if (sprite_index == spr_goomba && int_state < 3){
    x += int_dir * 2;
}

//Flip direction when I touch something, make sure I am not dying by fireball
if (place_meeting(x, y, par_brick) && int_state < 3){
    while(place_meeting(x, y, par_brick)){
        x += -int_dir
    }
    int_dir *= -1;
}

//What state am I currently in?
switch(int_state){
    case 0:
    if (place_meeting(x, y + 1, par_brick)){
    //Do nothing
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
    //Squashed
    case 2:
    break;
    //Hit by fireball
    case 3:
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
    

