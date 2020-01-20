/// @description Grow mario from little mario to big mario

//The grow state alters the image_xscale and image_yscale of mario to give that neat growth animation
switch(int_powerUpOrDownState){

    case 0:
    if (int_form > 0){
        ;
    }else{
        int_form = 1;
        int_state = en_states.powerupOrDown;
        sprite_index = spr_marioIdleLg;
        image_xscale = 1;
        image_yscale = 1;
        int_powerUpOrDownState ++;
        alarm[0] = 2;
    }
    break;
    
    case 1:
    image_xscale = .5;
    image_yscale = .5;
    int_powerUpOrDownState ++;
    alarm[0] = 2;
    break;
    
    case 2:
    image_xscale = .75;
    image_yscale = .75;
    int_powerUpOrDownState ++;
    alarm[0] = 2;
    break;
    
    case 3:
    image_xscale = .5;
    image_yscale = .5;
    int_powerUpOrDownState ++;
    alarm[0] = 2;
    break;
    
    case 4:
    image_xscale = .75;
    image_yscale = .75;
    int_powerUpOrDownState ++;
    alarm[0] = 2;
    break;
    
    case 5:
    image_xscale = 1;
    image_yscale = 1;
    int_powerUpOrDownState ++;
    alarm[0] = 2;
    break;
    
    case 6:
    image_xscale = .5;
    image_yscale = .5;
    int_powerUpOrDownState ++;
    alarm[0] = 2;
    break;
    
    case 7:
    image_xscale = .75;
    image_yscale = .75;
    int_powerUpOrDownState ++;
    alarm[0] = 2;
    break;
    
    case 8:
    image_xscale = 1;
    image_yscale = 1;
    int_powerUpOrDownState = 0;
    y = floor(y);
    while(place_meeting(x, y, par_brick)){
        y --;
    }
    int_state = en_states.idle;
    break;
}

