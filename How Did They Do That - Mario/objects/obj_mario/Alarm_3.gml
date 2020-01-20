/// @description Change from fire flower mario to regular big mario

//This is how we change into regular big mario from fire flower mario
switch(int_powerUpOrDownState){

    case 0:
    int_form = 1;
    b_invincible = true;
    sprite_index = spr_marioIdleLg;
    int_powerUpOrDownState ++;
    alarm[3] = 2;
    break;
    
    case 1:
    sprite_index = spr_marioIdleFLg;
    int_powerUpOrDownState ++;
    alarm[3] = 2;
    break;
    
    case 2:
    sprite_index = spr_marioIdleLg;
    int_powerUpOrDownState ++;
    alarm[3] = 2;
    break;
    
    case 3:
    sprite_index = spr_marioIdleFLg;
    int_powerUpOrDownState ++;
    alarm[3] = 2;
    break;
    
    case 4:
    sprite_index = spr_marioIdleLg;
    int_powerUpOrDownState ++;
    alarm[3] = 2;
    break;
    
    case 5:
    sprite_index = spr_marioIdleFLg;
    int_powerUpOrDownState ++;
    alarm[3] = 2;
    break;
    
    case 6:
    sprite_index = spr_marioIdleLg;
    int_powerUpOrDownState ++;
    alarm[3] = 2;
    break;
    
    case 7:
    sprite_index = spr_marioIdleFLg;
    int_powerUpOrDownState ++;
    alarm[3] = 2;
    break;
    
    case 8:
    sprite_index = spr_marioIdleLg;
    int_powerUpOrDownState = 0;
    y = floor(y);
    while(place_meeting(x, y, par_brick)){
        y --;
    }
    int_state = en_states.idle;
    alarm[4] = 45;
    break;
}

