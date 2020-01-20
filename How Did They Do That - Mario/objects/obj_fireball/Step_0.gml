/// @description Meat and potatoes

//Move in the correct direction
x += int_dir * 15;

//Flip directions if we sense a brick, loop close to it if it is within range
if (place_meeting(x, y, par_brick)){
    if (!position_meeting(x, y + 1, par_brick)){
        while(place_meeting(x, y, par_brick)){
            x += -int_dir;
        }
        int_dir *= -1;
    }
} 

//Collision with an enemy. Activate their event_user(1)
var t = instance_place(x, y, par_enemy);
if (t > -4){
    with(t){
        event_user(1);
    }
    instance_create(x, y, obj_fireballExpl);
    instance_destroy();
}

//Analyze state of fireball
switch(int_state){
    //Float downward
    case 0:
    y += 15;
    if (place_meeting(x, y, par_brick)){
        while(place_meeting(x, y, par_brick)){
            y --;
        }
        int_gravity = 0;
        int_state = 1;
    }
    break;
    //Bump upward
    case 1:
    y += -5 + int_gravity;
    if (int_gravity < 5){
        int_gravity ++;
    }else{
        int_gravity = 0;
        int_state = 2;
    }
    break;
    //Fall
    case 2:
    y += int_gravity;
    if (int_gravity < 18){
        int_gravity ++;
    }
    if (place_meeting(x, y, par_brick)){
        while(place_meeting(x, y, par_brick)){
            y --;
        }
        int_gravity = 0;
        int_state = 1;
    }
    break;
}
        
    
    
    

