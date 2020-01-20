/// @description Meat and potatoes

//What to do if I am touching the player
if (place_meeting(x, y, obj_mario)){
    with(obj_mario){
        event_user(0);
    }
    instance_destroy();
}

//Analyze my current state
switch(int_state){
    //Move up and out of the block
    case 0:
    y -= .5;
    break;
    //Move left and right
    case 1:
    if (place_meeting(x, y + 1, par_brick)){
        x += int_dir * 2;
        var t = instance_place(x, y, par_brick);
        if (t > -4){
            if (t.b_bump){
                int_gravity = 0;
                int_state = 2;
            }else{
                while(place_meeting(x, y, t)){
                    x += -int_dir;
                }
                int_dir *= -1;
            }
        }
    }else{
        int_gravity = 0;
        int_state = 3;
    }   
    break;
    //Bumping up
    case 2:
    x += int_dir * 2;
    var t = instance_place(x, y, par_brick);
    if (t > -4){
        if (!t.b_bump){
            while(place_meeting(x, y, t)){
                x += -int_dir;
            }
            int_dir *= -1;
        }
    }
    y += -18 + int_gravity;
    if (int_gravity < 18){
        int_gravity += 2.5;
    }else{
        int_gravity = 0;
        int_state = 3;
    }
    break;
    //Falling
    case 3:
    x += int_dir * 2;
    if (place_meeting(x, y, par_brick)){
        while(place_meeting(x, y, par_brick)){
            x += -int_dir;
        }
        int_dir *= -1;
    }
    y += int_gravity;
    if (int_gravity < 18){
        int_gravity += 1.5;
    }
    if (place_meeting(x, y, par_brick)){
        y = floor(y);
        while(place_meeting(x, y, par_brick)){
            y --;
        }
        int_state = 1;
    }
    break;
}

