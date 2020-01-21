/// @description Meat and potatoes

/*
We control our character thru what is called an FSM, or a "finite-state-machine".
It works by analyzing the current state of the character and allowing certain actions to happen
based on the actual state the character it is within
*/

var a, b, c, d, e;
var grav_constant = 14;  //default 18
var speed_constant = 8;   //default 5

//Get keyboard inputs
a = keyboard_check(ord("D")) - keyboard_check(ord("A"));//Which direction am I trying to go? -1 left or 1 right
b = keyboard_check(vk_space);//Am I trying to run? 0 false 1 true
c = keyboard_check(ord("W"));//Am I trying to jump? 0 false 1 true
d = keyboard_check(ord("S"));//Am I trying to duck? 0 false 1 true
e = keyboard_check_pressed(vk_space);//Did I press the space key this frame? 0 false 1 true (This is for shooting fireballs in form 2)

//Get gamepad inputs
/*
a = gamepad_button_check(0,gp_padr)-gamepad_button_check(0,gp_padl); 
c = gamepad_button_check(0,gp_face1);
d = gamepad_button_check(0,gp_padd);
*/


//Activate all objects within this region (We keep them in suspension until they are within range)
instance_activate_region(__view_get( e__VW.XView, 0 ), 0, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), room_height, true);

//Flip the sprite based on the character input (make sure it 'a' is NOT 0 - otherwise he will be flat and invisible).
if (a <> 0){
    if (int_state <> en_states.jump && int_state <> en_states.fall && int_state <> en_states.death){//Do not allow the player to flip image_xscale if they are jumping or falling
        image_xscale = a;
    }
    if (int_state <> en_states.duck && int_state <> en_states.powerupOrDown && int_state <> en_states.death){//Do not mess with int_xSpeed if I am ducking or powering up or dead
        int_xSpeed += a;//Increase xSpeed by a (-1 or 1 until it reaches either -5 / 5, or -7 / 7 if we are sprinting) 
    }else{
        int_xSpeed += -sign(int_xSpeed);
    }
}else{
    int_xSpeed += -sign(int_xSpeed);//Return x speed to 0
}

//Increase x by int_Xspeed, increase this further if we are running (If b is true - remember it is either a 0 or 1)
if (place_meeting(x + int_xSpeed + b * sign(int_xSpeed), y, par_brick)){
    while(!place_meeting(x + sign(int_xSpeed), y, par_brick)){
        x += sign(int_xSpeed);
    }
    int_xSpeed = a;
}else{
    x += int_xSpeed + b * sign(int_xSpeed);
}

//Do not allow xSpeed to go higher or lower than -5 or 5 or -7 / 7 if the player is running (shift)
int_xSpeed = clamp(int_xSpeed, -speed_constant + b * -3, speed_constant + b * 3);

//Shooting a fireball, but only in form 2 and only while I am not ducking
if (int_form == 2 && e && int_state <> en_states.duck){
    instance_create(x + image_xscale * 7, y - 48, obj_fireballExpl);
    with(instance_create(x, y - 48, obj_fireball)){
        int_dir = other.image_xscale;
    }
}

//Analyze the state of the player and adjust his mechanics
switch(int_state){
    //Idle
    case en_states.idle:
    if (c){
        int_gravity = 0;
        int_state = en_states.jump;
    }else{
        if (d && int_form > 0){
            int_state = en_states.duck;
			y -= 170;//makes mario a ninja
        }else{
            var t = instance_place(x, y, par_enemy);
            if (t > -4 && !b_invincible){
                switch(t.object_index){
                    default:
                    if (int_form > 0){
                        alarm[1 + int_form] = 1;
                        int_state = en_states.powerupOrDown;
                    }else{
                        int_gravity = 0;
                        int_state = en_states.death;
                    }
                    break;
                    case obj_koopa:
                    if (t.int_state <> 2){
                        if (int_form > 0){
                            alarm[1 + int_form] = 1;
                            int_state = en_states.powerupOrDown;
                        }else{
                            int_gravity = 0;
                            int_state = en_states.death;
                        }
                    }else{
                        t.int_state = 3;
                        t.int_dir = image_xscale;
                    }
                    break;
                }  
            }else{  
                if (place_meeting(x, y + 1, par_brick)){
                    if (a <> 0){ 
                        int_state = en_states.run;
                    }else{
                        sprite_index = spr_marioSprite[int_form, 0];
                        image_speed = 0;
                    }
                }else{
                    int_gravity = 0;
                    int_state = en_states.fall;
                }
            }
        }
    }
    break;
    //Run
    case en_states.run:
    if (c){
        int_gravity = 0;
        int_state = en_states.jump;
    }else{
        if (d && int_form > 0){
            int_state = en_states.duck;
        }else{
            var t = instance_place(x, y, par_enemy);
            if (t > -4 && !b_invincible){
                switch(t.object_index){
                    default:
                    if (int_form > 0){
                        alarm[1 + int_form] = 1;
                        int_state = en_states.powerupOrDown;
                    }else{
                        int_gravity = 0;
                        int_state = en_states.death;
                    }
                    break;
                    case obj_koopa:
                    if (t.int_state <> 2){
                        if (int_form > 0){
                            alarm[1 + int_form] = 1;
                            int_state = en_states.powerupOrDown;
                        }else{
                            int_gravity = 0;
                            int_state = en_states.death;
                        }
                    }else{
                        t.int_state = 3;
                        t.int_dir = image_xscale;
                        with(t){
                            while(place_meeting(x, y, obj_mario)){
                                x += other.image_xscale;
                            }
                        }
                    }
                    break;
                }  
            }else{
                if (place_meeting(x, y + 1, par_brick)){
                    if (a <> 0){
                        if (sign(int_xSpeed) == a){
                            sprite_index = spr_marioSprite[int_form, 1];
                            image_speed = .5 + b / 3;
                        }else{
                            sprite_index = spr_marioSprite[int_form, 3];
                            image_speed = 0;
                        }
                    }else{
                        int_state = en_states.idle;
                    }
                }else{
                    int_gravity = 0;
                    int_state = en_states.fall;
                }
            } 
        }
    }
    break;
    //Fall
    case en_states.fall:
    if (place_meeting(x, y + 1, par_brick)){
        if (a <> 0){
            int_state = en_states.run;
        }else{
            int_state = en_states.idle;
        }
    }else{
        if (d && int_form > 0){
            sprite_index = spr_marioSprite[int_form, 4];
        }else{
            sprite_index = spr_marioSprite[int_form, 2];
        }
        image_speed = 0;
        y += int_gravity;
        if (int_gravity < grav_constant){
            int_gravity += 1.5;
        }
        var t = instance_place(x, y, par_enemy);
        if (t > -4){
            with(t){
                event_user(0);
            }
            y = floor(y);
            int_gravity = 6;
            int_state = en_states.jump;
        }else{
            if (place_meeting(x, y, par_brick)){
                y = floor(y);
                while(place_meeting(x, y, par_brick)){
                    y --;
                }
                int_gravity = 0;
            }
        }
    }   
	//if (c){
        //int_gravity = 0;
		//y = 0;
        //int_state = en_states.jump;
    //}
    break;
    //Jump
    case en_states.jump:
    if (d && int_form > 0){
        sprite_index = spr_marioSprite[int_form, 4];
    }else{
        sprite_index = spr_marioSprite[int_form, 2];
    }
    image_speed = 0;
    y += -grav_constant + int_gravity;
    if (int_gravity < grav_constant){
        if (c){
            int_gravity ++;
        }else{
            int_gravity += 2;
        }
    }else{
        int_gravity = 0;
        int_state = en_states.fall;
    }
    t = instance_position(x, y - sprite_height, par_brick);
    if (t == -4){
        t = instance_place(x, y, par_brick);
    }
    if (t > -4){
        y = ceil(y);
        if (t.object_index == obj_brickBreak){
            with(t){
                event_user(other.int_form);
            }
        }else{
            with(t){
                event_user(0);
            }
        }
        while(place_meeting(x, y, par_brick)){
            y ++;
        }
        int_gravity = 0;
        int_state = en_states.fall;
    }
    break;
    //Duck (only if I am large tho)
    case en_states.duck:
    if (place_meeting(x, y + 1, par_brick)){
        if (d){
            sprite_index = spr_marioSprite[int_form, 4];
            image_speed = 0;
        }else{
            if (a <> 0){
                int_state = en_states.run;
            }else{
                int_state = en_states.idle;
            }
        }
    }else{
        int_state = en_states.fall;
    }
    break;
    //Power up
    case en_states.powerupOrDown:
    image_speed = 0;
    //Basically do nothing and freeze myself. We will will halt everything until the powerup is complete (take a look at alarms 0 - 3)
    break;
    //Death 
    case en_states.death:
    sprite_index = spr_marioDead;
    int_xSpeed = 0;
    y += -grav_constant + int_gravity;
    if (int_gravity < 36){
        int_gravity ++;
    }
    if (y > room_height + 100){
        room_restart();
    }
    break;
}




/* */
/*  */
